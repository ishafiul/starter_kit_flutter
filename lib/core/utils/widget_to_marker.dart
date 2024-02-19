import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Extension on [Widget] providing a method to convert the widget into a [BitmapDescriptor].
extension ToBitDescription on Widget {
  /// Converts the widget into a [BitmapDescriptor].
  ///
  /// Parameters:
  /// - `logicalSize`: The logical size of the widget, used for layout calculations.
  /// - `imageSize`: The size of the resulting image.
  /// - `waitToRender`: Duration to wait for rendering, especially useful for widgets with delayed content like network or asset images.
  /// - `textDirection`: The text direction of the widget.
  ///
  /// Returns a [Future] containing the [BitmapDescriptor] generated from the widget.
  Future<BitmapDescriptor> toBitmapDescriptor({
    Size? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 300),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: this,
        ),
      ),
    );
    final pngBytes = await createImageFromWidget(
      widget,
      waitToRender: waitToRender,
      logicalSize: logicalSize,
      imageSize: imageSize,
    );
    return BitmapDescriptor.fromBytes(pngBytes);
  }
}

/// Creates an image from the given widget by rendering it into a [BitmapDescriptor].
///
/// The final image will be of size [imageSize], and the widget will be laid out with the given [logicalSize].
/// By default, values of [imageSize] and [logicalSize] will be calculated from the app's main window.
Future<Uint8List> createImageFromWidget(
  Widget widget, {
  Size? logicalSize,
  required Duration waitToRender,
  Size? imageSize,
}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;
  logicalSize ??= view.physicalSize / view.devicePixelRatio;
  imageSize ??= view.physicalSize;

  final RenderView renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      size: logicalSize,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  await Future.delayed(waitToRender);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await repaintBoundary.toImage(
    pixelRatio: imageSize.width / logicalSize.width,
  );
  final ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );

  return byteData!.buffer.asUint8List();
}

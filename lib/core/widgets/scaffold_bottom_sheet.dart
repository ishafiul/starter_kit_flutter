import 'package:flutter/material.dart';

/// StickyScaffoldBottomSheet
class StickyScaffoldBottomSheet extends StatefulWidget {
  /// Creates a `SearchingProviderBottomSheet`.
  const StickyScaffoldBottomSheet({
    super.key,
    this.initialChildSize = 0.14,
    this.minChildSize = 0.14,
    this.maxChildSize = 0.65,
    this.snapChildSize = 0.17,
    this.expand = false,
    this.snap = true,
    this.snapSizes,
    this.snapAnimationDuration,
    this.controller,
    this.maximizeWidgets,
    this.minimizeWidgets,
    this.shouldCloseOnMinExtent = true,
  });

  /// The initial fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// Rebuilding the sheet with a new [initialChildSize] will only move
  /// the sheet to the new value if the sheet has not yet been dragged since it
  /// was first built or since the last call to [DraggableScrollableActuator.reset].
  ///
  /// The default value is `0.5`.
  final double initialChildSize;

  /// The minimum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// The default value is `0.25`.
  final double minChildSize;

  /// The maximum fractional value of the parent container's height to use when
  /// displaying the widget.///
  ///
  /// The default value is `0.17`.
  final double snapChildSize;

  /// The maximum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// The default value is `1.0`.
  final double maxChildSize;

  /// Whether the widget should expand to fill the available space in its parent
  /// or not.
  ///
  /// In most cases, this should be true. However, in the case of a parent
  /// widget that will position this one based on its desired size (such as a
  /// [Center]), this should be set to false.
  ///
  /// The default value is true.
  final bool expand;

  /// Whether the widget should snap between [snapSizes] when the user lifts
  /// their finger during a drag.
  ///
  /// If the user's finger was still moving when they lifted it, the widget will
  /// snap to the next snap size (see [snapSizes]) in the direction of the drag.
  /// If their finger was still, the widget will snap to the nearest snap size.
  ///
  /// Snapping is not applied when the sheet is programmatically moved by
  /// calling [DraggableScrollableController.animateTo] or [DraggableScrollableController.jumpTo].
  ///
  /// Rebuilding the sheet with snap newly enabled will immediately trigger a
  /// snap unless the sheet has not yet been dragged away from
  /// [initialChildSize] since first being built or since the last call to
  /// [DraggableScrollableActuator.reset].
  final bool snap;

  /// A list of target sizes that the widget should snap to.
  ///
  /// Snap sizes are fractional values of the parent container's height. They
  /// must be listed in increasing order and be between [minChildSize] and
  /// [maxChildSize].
  ///
  /// The [minChildSize] and [maxChildSize] are implicitly included in snap
  /// sizes and do not need to be specified here. For example, `snapSizes = [.5]`
  /// will result in a sheet that snaps between [minChildSize], `.5`, and
  /// [maxChildSize].
  ///
  /// Any modifications to the [snapSizes] list will not take effect until the
  /// `build` function containing this widget is run again.
  ///
  /// Rebuilding with a modified or new list will trigger a snap unless the
  /// sheet has not yet been dragged away from [initialChildSize] since first
  /// being built or since the last call to [DraggableScrollableActuator.reset].
  final List<double>? snapSizes;

  /// Defines a duration for the snap animations.
  ///
  /// If it's not set, then the animation duration is the distance to the snap
  /// target divided by the velocity of the widget.
  final Duration? snapAnimationDuration;

  /// A controller that can be used to programmatically control this sheet.
  final DraggableScrollableController? controller;

  /// Whether the sheet, when dragged (or flung) to its minimum size, should
  /// cause its parent sheet to close.
  ///
  /// Set on emitted [DraggableScrollableNotification]s. It is up to parent
  /// classes to properly read and handle this value.
  final bool shouldCloseOnMinExtent;

  /// The widget to display when the sheet is minimized.
  final List<Widget>? minimizeWidgets;

  /// The widget to display when the sheet is maximized.
  final List<Widget>? maximizeWidgets;

  @override
  State<StickyScaffoldBottomSheet> createState() =>
      _StickyScaffoldBottomSheetState();
}

class _StickyScaffoldBottomSheetState extends State<StickyScaffoldBottomSheet> {
  DraggableScrollableController? draggableScrollableController;
  double draggableScrollableSheetExtent = 0;

  @override
  void initState() {
    super.initState();
    draggableScrollableController = DraggableScrollableController();
  }

  @override
  void dispose() {
    draggableScrollableController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        draggableScrollableSheetExtent = notification.extent;
        setState(() {});
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.14,
        minChildSize: 0.14,
        maxChildSize: 0.65,
        snap: true,
        expand: false,
        controller: draggableScrollableController,
        builder: (dragSheetContext, scrollController) {
          if (draggableScrollableSheetExtent <= widget.snapChildSize) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                controller: scrollController,
                children: widget.minimizeWidgets ?? const [SizedBox()],
              )
            );
          }
          return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                controller: scrollController,
                children: widget.maximizeWidgets ?? const [SizedBox()],
              )
          );
        },
      ),
    );
  }
}

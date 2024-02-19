import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';
import 'package:starter_kit_flutter/core/utils/widget_to_marker.dart';

/// Initializes a custom marker for a Google Map with specified parameters.
///
/// Parameters:
/// - `image`: The image asset path to be displayed within the marker.
/// - `color`: The background color of the marker.
/// - `position`: The geographical position where the marker is placed.
/// - `id`: The unique identifier for the marker.
///
/// Returns a Future containing the configured [Marker] for use on a Google Map.
Future<Marker> initMarkers({
  required String image,
  required Color color,
  required LatLng position,
  required MarkerId id,
}) async {
  // Size of the marker
  final size = Size(120.r, 120.r);

  // Constructing the marker with a custom design
  return Marker(
    position: position,
    markerId: id,
    icon: await Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Animated container for a dynamic effect
        Positioned(
          bottom: 6,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            height: 14.r,
            width: 14.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              boxShadow: kElevationToShadow[4],
            ),
          ),
        ),
        // Location icon with a shadow
        Icon(
          Icons.location_on,
          color: Colors.white,
          shadows: kElevationToShadow[2],
          size: size.height,
        ),
        // Positioned container for the user's image
        Positioned(
          top: 0,
          child: Container(
            width: size.height * 0.7,
            height: size.width * 0.7,
            alignment: Alignment.center,
            padding: 8.paddingAll(),
            decoration: BoxDecoration(
              color: color,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.circular(10000).r,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10000).r,
              child: Image.network(
                image,
                fit: BoxFit.fill,
                width: size.height * 0.7,
                height: size.width * 0.7,
              ),
            ),
          ),
        ),
      ],
    ).toBitmapDescriptor(
      imageSize: size,
      logicalSize: size,
      waitToRender: const Duration(seconds: 2),
    ),
  );
}

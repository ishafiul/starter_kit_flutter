import 'package:starter_kit_flutter/comon/config/colors.dart';
import 'package:flutter/material.dart';

enum ArtistaCardType { primary, warning, danger, success }

class ArtistaCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final ArtistaCardType cardType;
  final Function()? onTap;
  final Color? borderColor;
  final Color? bgColor;
  final BorderRadiusGeometry? borderRadius;

  const ArtistaCard({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    required this.cardType,
    this.borderColor,
    required this.child,
    this.onTap,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [],
      ),
      child: Stack(
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            color: bgColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? _color(cardType)),
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(10),
                  ),
            ),
            child: SizedBox(
              width: width ?? double.infinity,
              height: height,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onTap: onTap,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _color(ArtistaCardType type) {
    if (type == ArtistaCardType.primary) {
      return ArtistaColor.primary.shade50;
    }
    if (type == ArtistaCardType.warning) {
      return ArtistaColor.warning.shade50;
    }
    if (type == ArtistaCardType.success) {
      return ArtistaColor.success.shade50;
    } else {
      return ArtistaColor.danger.shade50;
    }
  }
}

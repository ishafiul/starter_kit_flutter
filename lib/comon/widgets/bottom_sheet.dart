import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArtistaBottomSheet {
  final BuildContext context;
  final Widget child;
  double? height;
  bool? isBarIcon;

  ArtistaBottomSheet({
    required this.context,
    required this.child,
    this.height,
    this.isBarIcon = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.pop();
          },
          child: GestureDetector(
            onTap: () {
            },
            child: DraggableScrollableSheet(
              initialChildSize: height ?? 0.6,
              minChildSize: height ?? 0.3,
              builder: (context, scrollController) => Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    if (isBarIcon == true)
                      Icon(
                        Icons.remove,
                        color: Colors.grey[600],
                      ),
                    child
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:starter_kit_flutter/common/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppBarBottom extends HookWidget {
  final Widget child;

  const AppBarBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0.0, 60.0),
      child: GestureDetector(
        onTap: () {
          /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SearchModal()));*/
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            color: ArtistaColor.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: child,
        ),
      ),
    );
  }
}

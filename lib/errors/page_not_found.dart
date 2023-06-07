import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit_flutter/comon/config/const.dart';
import 'package:starter_kit_flutter/comon/utils/extensions.dart';
import 'package:starter_kit_flutter/comon/widgets/button.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: Space.md,
            ),
            Text("Page Not Found!", style: context.textTheme.displayLarge),
            const SizedBox(
              height: Space.xxl,
            ),
            Button(
              buttonType: ButtonType.elevatedPrimary,
              buttonSize: ButtonSize.md,
              buttonColor: ButtonColor.warning,
              isFullWidth: false,
              onPressed: () {
                context.go('/');
              },
              child: Text(
                'Go Back To Home',
                style: context.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

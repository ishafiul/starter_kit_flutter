import 'package:flutter/material.dart';
import 'package:starter_kit_flutter/common/config/colors.dart';
import 'package:starter_kit_flutter/common/utils/extensions.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  late final ButtonType? buttonType;
  final ButtonSize buttonSize;
  final ButtonColor buttonColor;
  final bool? isFullWidth;
  final Widget child;

  Button({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.elevatedPrimary;
  }

  Button.text({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.text;
  }


  Button.outline({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.outline;
  }

  Button.elevatedPrimary({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.elevatedPrimary;
  }

  Button.elevatedSecondary({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.elevatedSecondary;
  }

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.text) {
      return textButton(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.elevatedPrimary) {
      return elevatedButtonPrimary(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.elevatedSecondary) {
      return elevatedButtonSecondary(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.outline) {
      return outlineButton(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else {
      return SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      );
    }
  }
}

enum ButtonType { text, elevatedPrimary, elevatedSecondary, outline }

enum ButtonSize { xl, lg, md, sm, xsm }

enum ButtonColor { info, primary, warning, danger, success, secondary }

Widget textButton({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.textButtonTheme.style?.copyWith(
        foregroundColor: getColor(buttonColor: buttonColor),
      ),
      child: child,
    ),
  );
}

Widget elevatedButtonPrimary({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.elevatedButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? const MaterialStatePropertyAll(Colors.white)
            : const MaterialStatePropertyAll(ArtistaColor.disableText),
        backgroundColor:
            onPressed != null ? getColor(buttonColor: buttonColor) : MaterialStatePropertyAll(ArtistaColor.disable),
      ),
      child: child,
    ),
  );
}

Widget elevatedButtonSecondary({
  required ButtonSize buttonSize,
  bool? isFullWidth = false,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.elevatedButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(ArtistaColor.disableText),
        backgroundColor: onPressed != null
            ? getColor(
                buttonColor: buttonColor,
                buttonType: ButtonType.elevatedSecondary,
              )
            : MaterialStatePropertyAll(ArtistaColor.disable),
      ),
      child: Center(child: child),
    ),
  );
}

Widget outlineButton({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.outlineButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(ArtistaColor.disableText),
        side: MaterialStateProperty.resolveWith<BorderSide>((_) {
          return BorderSide(
            color: onPressed != null ? getColorOnly(buttonColor: buttonColor) : ArtistaColor.disable,
          );
        }),
      ),
      child: child,
    ),
  );
}

double getHeight(ButtonSize buttonSize) {
  if (buttonSize == ButtonSize.xl) {
    return 72;
  } else if (buttonSize == ButtonSize.lg) {
    return 65;
  } else if (buttonSize == ButtonSize.md) {
    return 50;
  } else if (buttonSize == ButtonSize.sm) {
    return 42;
  } else {
    return 36;
  }
}

/*double getWidth(ButtonSize buttonSize) {
  if (buttonSize == ButtonSize.xl) {
    return 108;
  } else if (buttonSize == ButtonSize.lg) {
    return 100;
  } else if (buttonSize == ButtonSize.xsm) {
    return 64;
  } else {
    return 82;
  }
}*/

MaterialStateProperty<Color?> getColor({
  required ButtonColor buttonColor,
  ButtonType? buttonType,
}) {
  if (buttonType != null && buttonType == ButtonType.elevatedSecondary) {
    if (buttonColor == ButtonColor.success) {
      return MaterialStatePropertyAll(ArtistaColor.success.shade50);
    } else if (buttonColor == ButtonColor.primary) {
      return MaterialStatePropertyAll(ArtistaColor.primary.shade50);
    } else if (buttonColor == ButtonColor.info) {
      return const MaterialStatePropertyAll(ArtistaColor.infoShade20);
    } else if (buttonColor == ButtonColor.warning) {
      return MaterialStatePropertyAll(ArtistaColor.warning.shade50);
    } else if (buttonColor == ButtonColor.secondary) {
      return MaterialStatePropertyAll(ArtistaColor.secondary.shade50);
    } else {
      return MaterialStatePropertyAll(ArtistaColor.danger.shade50);
    }
  } else {
    return MaterialStatePropertyAll(getColorOnly(buttonColor: buttonColor));
  }
}

Color getColorOnly({required ButtonColor buttonColor}) {
  if (buttonColor == ButtonColor.success) {
    return ArtistaColor.success;
  } else if (buttonColor == ButtonColor.primary) {
    return ArtistaColor.primary;
  } else if (buttonColor == ButtonColor.info) {
    return ArtistaColor.info;
  } else if (buttonColor == ButtonColor.warning) {
    return ArtistaColor.warning;
  } else if (buttonColor == ButtonColor.secondary) {
    return ArtistaColor.secondary;
  } else {
    return ArtistaColor.danger;
  }
}

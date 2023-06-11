import 'package:flutter/material.dart';
import 'package:starter_kit_flutter/common/config/colors.dart';
import 'package:starter_kit_flutter/common/config/const.dart';
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
    buttonType = ButtonType.elevated;
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

  Button.filled({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.filled;
  }

  Button.tonal({
    super.key,
    this.onPressed,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.tonal;
  }

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.text) {
      return text(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.filled) {
      return filled(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.tonal) {
      return tonal(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.outline) {
      return outline(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.icon) {
      return outline(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else {
      return elevated(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    }
  }
}

enum ButtonType { text, elevated, filled, outline, tonal, icon }

enum ButtonSize { xl, lg, md, sm, xsm }

enum ButtonColor { info, primary, warning, danger, success, secondary }

Widget filled({
  required ButtonSize buttonSize,
  bool? isFullWidth = false,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  final inverseBW = InverseBW();
  return SizedBox(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    child: FilledButton(
      onPressed: onPressed,
      style: context.filledButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? MaterialStatePropertyAll(
                HexColor.fromHex(inverseBW.getInverseBW(getColorOnly(buttonColor: buttonColor).toHex())),
              )
            : null,
        backgroundColor: onPressed != null ? getColor(buttonColor: buttonColor) : null,
      ),
      child: child,
    ),
  );
}

Widget text({
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
      style: context.textButtonTheme.style?.copyWith(
        foregroundColor: getColor(buttonColor: buttonColor),
      ),
      child: child,
    ),
  );
}

Widget elevated({
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
    child: ElevatedButton(
      onPressed: onPressed,
      style: context.elevatedButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(ArtistaColor.disableText),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      child: child,
    ),
  );
}

Widget tonal({
  required ButtonSize buttonSize,
  bool? isFullWidth = false,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return Container(
    width: isFullWidth! ? double.infinity : null,
    height: getHeight(buttonSize),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(buttonBorderRadius),
      ),
      color: Colors.white,
    ),
    child: FilledButton.tonal(
      onPressed: onPressed,
      style: context.filledButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null ? getColor(buttonColor: buttonColor) : null,
        backgroundColor: onPressed != null
            ? getColor(
                buttonColor: buttonColor,
                buttonType: ButtonType.filled,
              )
            : null,
      ),
      child: child,
    ),
  );
}

Widget outline({
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
    child: OutlinedButton(
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
  if (buttonType != null && buttonType == ButtonType.filled) {
    if (buttonColor == ButtonColor.success) {
      return MaterialStatePropertyAll(ArtistaColor.success.shade50.withOpacity(0.5));
    } else if (buttonColor == ButtonColor.primary) {
      return MaterialStatePropertyAll(ArtistaColor.primary.shade50.withOpacity(0.5));
    } else if (buttonColor == ButtonColor.info) {
      return MaterialStatePropertyAll(ArtistaColor.info.shade50.withOpacity(0.5));
    } else if (buttonColor == ButtonColor.warning) {
      return MaterialStatePropertyAll(ArtistaColor.warning.shade50.withOpacity(0.5));
    } else if (buttonColor == ButtonColor.secondary) {
      return MaterialStatePropertyAll(ArtistaColor.secondary.shade50.withOpacity(0.5));
    } else {
      return MaterialStatePropertyAll(ArtistaColor.danger.shade50.withOpacity(0.5));
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_flutter/core/config/colors.dart';
import 'package:starter_kit_flutter/core/const.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';

/// custom button
class Button extends StatelessWidget {
  /// on press button
  final Function()? onPressed;

  /// [ButtonType]
  late final ButtonType? buttonType;

  /// [ButtonSize]
  final ButtonSize buttonSize;

  /// [ButtonColor]
  final ButtonColor buttonColor;

  final Color? color;

  /// is full width
  final bool? isFullWidth;

  /// widget for the button
  final Widget child;

  ///basic button
  Button({
    super.key,
    this.onPressed,
    this.color,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.elevated;
  }

  /// text button
  Button.text({
    super.key,
    this.onPressed,
    this.color,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.text;
  }

  /// outline button
  Button.outline({
    super.key,
    this.onPressed,
    this.color,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.outline;
  }

  /// filled button
  Button.filled({
    super.key,
    this.onPressed,
    this.color,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = false,
    required this.child,
  }) {
    buttonType = ButtonType.filled;
  }

  /// secondary button
  Button.tonal({
    super.key,
    this.onPressed,
    this.color,
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
        color: color,
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

/// enum for button type
enum ButtonType {
  /// text
  text,

  /// elevated
  elevated,

  /// filled
  filled,

  /// outline
  outline,

  /// outline
  tonal,

  /// icon
  icon,
}

/// enum for button size
enum ButtonSize {
  /// size 72
  xl,

  /// size 65
  lg,

  /// size 48
  md,

  /// size 66
  sm,

  /// size 32
  xsm,
}

/// button color
enum ButtonColor {
  /// color [CColor.info]
  info,

  /// color [CColor.primary]
  primary,

  /// color [CColor.warning]
  warning,

  /// color [CColor.danger]
  danger,

  /// color [CColor.success]
  success,

  /// color [CColor.secondary]
  secondary,
}

/// return filled button widget
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
                HexColor.fromHex(
                  inverseBW.getInverseBW(
                    getColorOnly(buttonColor: buttonColor).toHex(),
                  ),
                ),
              )
            : null,
        backgroundColor:
            onPressed != null ? getColor(buttonColor: buttonColor) : null,
      ),
      child: child,
    ),
  );
}

/// return text button widget
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

/// return filled button widget
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
            : const MaterialStatePropertyAll(CColor.disableText),
        backgroundColor:
            MaterialStatePropertyAll(getColorOnly(buttonColor: buttonColor)),
      ),
      child: child,
    ),
  );
}

/// return tonal/filled button widget
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
        foregroundColor:
            onPressed != null ? getColor(buttonColor: buttonColor) : null,
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

/// return outline button widget
Widget outline({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  Color? color,
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
            ? color != null
                ? MaterialStatePropertyAll(color)
                : getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(CColor.disableText),
        // backgroundColor: MaterialStatePropertyAll(CColor.primary.shade50),
        side: MaterialStateProperty.resolveWith<BorderSide>((_) {
          return BorderSide(
            color: onPressed != null
                ? color ?? getColorOnly(buttonColor: buttonColor)
                : CColor.disable,
          );
        }),
      ),
      child: child,
    ),
  );
}

/// return button height
double getHeight(ButtonSize buttonSize) {
  if (buttonSize == ButtonSize.xl) {
    return 72.h;
  } else if (buttonSize == ButtonSize.lg) {
    return 65.h;
  } else if (buttonSize == ButtonSize.md) {
    return 48.h;
  } else if (buttonSize == ButtonSize.sm) {
    return 36.h;
  } else {
    return 32.h;
  }
}

/// return button color
MaterialStateProperty<Color?> getColor({
  required ButtonColor buttonColor,
  ButtonType? buttonType,
}) {
  if (buttonType != null && buttonType == ButtonType.filled) {
    if (buttonColor == ButtonColor.success) {
      return MaterialStatePropertyAll(
        CColor.success.shade50.withOpacity(0.5),
      );
    } else if (buttonColor == ButtonColor.primary) {
      return MaterialStatePropertyAll(
        CColor.primary.shade50.withOpacity(0.5),
      );
    } else if (buttonColor == ButtonColor.info) {
      return MaterialStatePropertyAll(
        CColor.info.shade50.withOpacity(0.5),
      );
    } else if (buttonColor == ButtonColor.warning) {
      return MaterialStatePropertyAll(
        CColor.warning.shade50.withOpacity(0.5),
      );
    } else if (buttonColor == ButtonColor.secondary) {
      return MaterialStatePropertyAll(
        CColor.secondary.shade50.withOpacity(0.5),
      );
    } else {
      return MaterialStatePropertyAll(
        CColor.danger.shade50.withOpacity(0.5),
      );
    }
  } else {
    return MaterialStatePropertyAll(getColorOnly(buttonColor: buttonColor));
  }
}

/// return button base color
MaterialColor getColorOnly({required ButtonColor buttonColor}) {
  if (buttonColor == ButtonColor.success) {
    return CColor.success;
  } else if (buttonColor == ButtonColor.primary) {
    return CColor.primary;
  } else if (buttonColor == ButtonColor.info) {
    return CColor.info;
  } else if (buttonColor == ButtonColor.warning) {
    return CColor.warning;
  } else if (buttonColor == ButtonColor.secondary) {
    return CColor.secondary;
  } else {
    return CColor.danger;
  }
}

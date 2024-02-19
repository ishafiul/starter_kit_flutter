import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_flutter/app/view/app.dart';
import 'package:starter_kit_flutter/core/config/colors.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';
import 'package:vibration/vibration.dart';

/// Enum representing different types of SnackBars.
///
/// Use this enum to specify the desired visual style and behavior when displaying SnackBars.
enum SnackBarType {
  /// Indicates an error-related SnackBar.
  error,

  /// Indicates a success-related SnackBar.
  success,

  /// Indicates a danger-related SnackBar.
  danger,

  /// Indicates an information-related SnackBar.
  info,

  /// Indicates a warning-related SnackBar.
  warning,

  /// Indicates a firebase related SnackBar.
  firebase
}

/// Displays a snack bar with various configurations based on the provided parameters.
///
/// Parameters:
/// - `builderContext`: The build context in which the snack bar should be displayed.
/// - `onPressed`: A callback function to be executed when the snack bar action is pressed.
/// - `type`: The type of the snack bar (error, success, danger, info, warning).
/// - `message`: The main message to be displayed in the snack bar.
/// - `title`: The title of the snack bar.
/// - `leadingIcon`: The icon displayed at the beginning of the snack bar.
/// - `tailingIcon`: The icon displayed at the end of the snack bar.
Future<void> showSnackBar({
  BuildContext? builderContext,
  Function? onPressed,
  required SnackBarType type,
  required String message,
  required String title,
  required IconData? leadingIcon,
  required IconData? tailingIcon,
}) async {
  await Vibration.vibrate(
    duration: 10,
  );

  await Vibration.vibrate(
    duration: 10,
  );
  late SnackBar snackBar;
  if (type == SnackBarType.warning) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD97541),
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.primary.shade50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: scaffoldMessageKey
                      .currentContext!.textTheme.titleMedium
                      ?.copyWith(
                    color: CColor.primary.shade50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CColor.warning),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: CColor.backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor:
        MaterialStateColor.resolveWith((states) => CColor.primary.shade50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.danger) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC14444),
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.primary.shade50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: scaffoldMessageKey
                      .currentContext?.textTheme.titleMedium
                      ?.copyWith(
                    color: CColor.primary.shade50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor:
        MaterialStateColor.resolveWith((states) => CColor.primary.shade50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.success) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              leadingIcon ?? Icons.check_circle,
              size: 26.r,
              color: CColor.primary,
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: scaffoldMessageKey.currentContext?.textTheme.bodyLarge
                      ?.copyWith(
                    color: CColor.primary.shade50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.r,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.success,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor:
        MaterialStateColor.resolveWith((states) => CColor.primary.shade50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.error) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 26,
            color: CColor.danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: scaffoldMessageKey.currentContext?.textTheme.bodyLarge
                  ?.copyWith(color: CColor.danger, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CColor.danger),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => CColor.danger),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.info) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CColor.primary.shade700,
            ),
            child: Icon(
              leadingIcon ?? Icons.warning_amber_outlined,
              size: 26,
              color: CColor.primary.shade50,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: scaffoldMessageKey
                      .currentContext?.textTheme.titleMedium
                      ?.copyWith(
                    color: CColor.primary.shade50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: CColor.primary,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor:
        MaterialStateColor.resolveWith((states) => CColor.primary.shade50),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.firebase) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CColor.primary.shade50,
            ),
            child: Icon(
              leadingIcon ?? Icons.notifications_active,
              size: 26.r,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16.r),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: scaffoldMessageKey
                      .currentContext?.textTheme.titleMedium
                      ?.copyWith(
                    color: CColor.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  message,
                  style: scaffoldMessageKey.currentContext?.textTheme.bodyMedium
                      ?.copyWith(
                    color: CColor.primary.shade300,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: CColor.primary,
        ),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor:
        MaterialStateColor.resolveWith((states) => CColor.primary.shade50),
        onPressed: () => onPressed,
      ),
    );
  }

  // Show the SnackBar using the provided build context
  scaffoldMessageKey.currentState?.removeCurrentSnackBar();
  scaffoldMessageKey.currentState?.showSnackBar(snackBar);
}
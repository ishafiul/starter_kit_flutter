import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_flutter/core/config/colors.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';

/// enum for snack-bar
enum SnackBarType {
  /// error snack-bar
  error,

  /// success snack-bar
  success,

  /// danger snack-bar
  danger,

  /// info snack-bar
  info,

  /// warning snack-bar
  warning;
}

/// [showSnackBar] from material  will call
void showSnackBar({
  required BuildContext builderContext,
  Function? onPressed,
  required SnackBarType type,
  required String message,
  required String title,
  required IconData? leadingIcon,
  required IconData? tailingIcon,
}) {
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
                  style: builderContext.textTheme.titleMedium?.copyWith(
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
      backgroundColor: CColor.secondary,
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
                  style: builderContext.textTheme.titleMedium?.copyWith(
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
      backgroundColor: CColor.secondary,
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
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF168016),
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
                  style: builderContext.textTheme.titleMedium?.copyWith(
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
              style: builderContext.textTheme.bodyLarge
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
              color: CColor.primary.shade800,
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
                  style: builderContext.textTheme.titleMedium?.copyWith(
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
  }

  ScaffoldMessenger.of(builderContext)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

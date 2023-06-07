import 'package:starter_kit_flutter/comon/config/colors.dart';
import 'package:starter_kit_flutter/comon/utils/extensions.dart';
import 'package:flutter/material.dart';


enum SnackBarType {
  error,
  success,
  danger,
  info,
  warning;
}

void showSnackBar({
  required BuildContext builderContext,
  Function? onPressed,
  required SnackBarType type,
  required String message,
}) {
  late SnackBar snackBar;
  if (type == SnackBarType.warning) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            size: 26,
            color: ArtistaColor.warning,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge?.copyWith(color: ArtistaColor.warning, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ArtistaColor.warning),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => ArtistaColor.warning),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.danger) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.dangerous_outlined,
            size: 26,
            color: ArtistaColor.danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge?.copyWith(color: ArtistaColor.danger, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ArtistaColor.danger),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => ArtistaColor.danger),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.success) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 26,
            color: ArtistaColor.success,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge?.copyWith(color: ArtistaColor.success, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ArtistaColor.success),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => ArtistaColor.success),
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
            color: ArtistaColor.danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge?.copyWith(color: ArtistaColor.danger, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ArtistaColor.danger),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => ArtistaColor.danger),
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.info) {
    snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 26,
            color: ArtistaColor.info,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: builderContext.textTheme.bodyLarge?.copyWith(color: ArtistaColor.info, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ArtistaColor.info),
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: MaterialStateColor.resolveWith((states) => ArtistaColor.info),
        onPressed: () => onPressed,
      ),
    );
  }

  ScaffoldMessenger.of(builderContext)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

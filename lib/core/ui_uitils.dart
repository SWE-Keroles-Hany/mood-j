import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class UiUtils {
  static ToastificationItem showMessage(
    BuildContext context,
    String message,
    bool isSucces,
  ) => toastification.show(
    foregroundColor: Colors.white,
    backgroundColor: isSucces
        ? Colors.green
        : const Color.fromARGB(255, 255, 2, 2),
    style: ToastificationStyle.flat,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    closeButton: ToastCloseButton(
      showType: CloseButtonShowType.onHover,
      buttonBuilder: (context, onClose) {
        return OutlinedButton.icon(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 20),
          label: const Text('Close'),
        );
      },
    ),
    context: context, // optional if you use ToastificationWrapper
    title: Text(message, style: TextStyle(fontSize: 16.sp)),
    autoCloseDuration: const Duration(seconds: 5),
  );

  static Future<dynamic> showLoadingIndicator(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          child: SizedBox(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) => Navigator.of(context).pop();
}

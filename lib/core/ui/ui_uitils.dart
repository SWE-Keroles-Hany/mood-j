import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/widgets/custom_input_field.dart';
import 'package:moodly_j/features/settings/widgets/notification_setting.dart';
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
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    // callbacks: ToastificationCallbacks(),
    icon: isSucces
        ? Icon(Icons.done_all_outlined, color: Colors.amber, size: 25.r)
        : Icon(Icons.error, color: Colors.black, size: 25.r),
    // showIcon: false,
    closeButton: ToastCloseButton(
      showType: CloseButtonShowType.onHover,
      buttonBuilder: (context, onClose) {
        return OutlinedButton.icon(
          onPressed: onClose,
          icon: const Icon(Icons.close, color: Colors.white, size: 20),
          label: const Text('Close'),
        );
      },
    ),
    // dragToClose: ,
    context: context, // optional if you use ToastificationWrapper
    title: Text(
      message,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    ),
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

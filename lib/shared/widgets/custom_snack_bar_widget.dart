import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/helpers/helper_enums.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class CustomSnackBarWidget {
  static void showSnack(
    BuildContext context,
    String message,
    TypeMessage typeMessage, {
    Duration? duration,
    SnackBarAction? action,
  }) {
    _onWidgetDidBuild(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
            child: Text(
              message,
              key: const Key('show-snack'),
            ),
          ),
          duration: duration ?? const Duration(seconds: 5),
          backgroundColor: HelperEnums.colorTypeMessage(typeMessage),
          action: action,
        ),
      );
    });
  }

  static void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

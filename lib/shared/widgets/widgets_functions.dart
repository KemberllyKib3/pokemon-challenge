import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon_challenge/shared/helpers/helper_enums.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_snack_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetsFunctions {
  static AppBar bigAppBar(
    BuildContext context, {
    IconButton? leading,
  }) {
    return AppBar(
      key: const Key('bigAppBar'),
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 120,
      backgroundColor: AppColors.red,
      leading: leading,
      iconTheme: const IconThemeData(color: AppColors.white, size: 30),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo, height: 45, width: 45),
          const SizedBox(height: 5),
          const Text(
            'PokéChallenge',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static AppBar smallAppBar(
    BuildContext context, {
    String title = '',
    Widget? action,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.red,
      actions: [
        SizedBox.square(
          dimension: 50,
          child: action,
        )
      ],
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Future<T?> push<T>(BuildContext context, WidgetBuilder widgetBuilder) {
    return Navigator.push<T>(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: widgetBuilder)
          : MaterialPageRoute(builder: widgetBuilder),
    );
  }

  static void showToast(String msg,
      {TypeMessage? typeMessage = TypeMessage.info}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 13,
      backgroundColor: HelperEnums.colorTypeMessage(typeMessage!),
    );
  }

  static void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static void showSnackError(
    BuildContext context, {
    required String message,
  }) {
    CustomSnackBarWidget.showSnack(
      context,
      message,
      TypeMessage.error,
    );
  }

  static Widget showLoading(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: Colors.white,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox.square(
            dimension: 25,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Wait a moment...",
            style: TextStyle(
              color: AppColors.gray,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

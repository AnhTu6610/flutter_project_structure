import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnClickOK();
typedef OnClickYes();
typedef OnClickNo();

Future<T?> showOkDialog<T>(
  BuildContext context,
  String title, {
  OnClickOK? onClickOK,
  String? textButton,
  String? content,
  bool? barrierDismissible,
}) async =>
    showCupertinoDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content ?? ""),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (onClickOK != null) onClickOK();
            },
            child: Text(textButton ?? "OK"),
          ),
        ],
      ),
    );

Future<T?> showYesNoDialog<T>(
  BuildContext context,
  String title, {
  OnClickOK? onClickYes,
  OnClickOK? onClickNo,
  String? textYesButton,
  String? textNoButton,
  String? content,
}) async =>
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content ?? ""),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (onClickNo != null) onClickNo();
            },
            child: Text(textNoButton ?? "No"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (onClickYes != null) onClickYes();
            },
            child: Text(textYesButton ?? "Yes"),
          ),
        ],
      ),
    );

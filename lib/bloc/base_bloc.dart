import 'dart:async';
import 'dart:io';

import 'package:flutter_project_structure/my_app.dart';
import 'package:flutter_project_structure/widgets/common_dialog.dart';
import 'package:logger/logger.dart';

abstract class BaseBloc {
  StreamController<bool> _loaddingController = StreamController<bool>();
  Stream<bool> get loaddingStream => _loaddingController.stream;
  Sink<bool> get loaddingSink => _loaddingController.sink;

  void showLoading() {
    loaddingSink.add(true);
  }

  void hideLoading() {
    loaddingSink.add(false);
  }

  void dispose() {
    _loaddingController.close();
  }

  String? _checkException(dynamic exception) {
    if (exception != null) {
      Logger().e(exception.runtimeType, "Type Exception");
      Logger().e(exception.toString(), "Exception");
    }
    if (exception is SocketException) return "Connection error. \n Please check the internet";
    if (exception is HttpException) return "No service found";
    if (exception is FormatException) return "Invalid format";
    if (exception is TimeoutException) return "Connection expired";
    return null;
  }

  Future showError(String? textError, [dynamic exception, Function? ontapOk]) async {
    loaddingSink.add(false);
    await showOkDialog(
      StateManager.navigatorKey.currentContext!,
      _checkException(exception) ?? textError ?? "Unknown error",
      onClickOK: () {
        if (ontapOk != null) ontapOk();
      },
    );
  }
}

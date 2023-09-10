import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class Channels {
  static const String screenRecordChannel = "app.flutter.dev/ScreenRecord";
}

class Methods {
  static const String preventScreenRecord = "preventScreenRecord";
  static const String disposePreventScreenRecord = "preventScreenRecordDispose";
}

class ScreenRecordHandlerChannel {
  ScreenRecordHandlerChannel();

  final MethodChannel _methodChannelPlatform =
      const MethodChannel(Channels.screenRecordChannel);

  void preventScreenRecord() {
    if (Platform.isIOS) {
      initPreventIos();
    } else if (Platform.isAndroid) {
      initPreventAndroid();
    }
  }

  void disposePreventScreenRecord() {
    if (Platform.isIOS) {
      disposePreventIos();
    } else if (Platform.isAndroid) {
      disposePreventAndroid();
    }
  }

  initPreventIos() {
    _methodChannelPlatform.invokeMethod(Methods.preventScreenRecord);
  }

  disposePreventIos() {
    _methodChannelPlatform.invokeMethod(Methods.disposePreventScreenRecord);
  }

  initPreventAndroid() {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  disposePreventAndroid() {
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }
}

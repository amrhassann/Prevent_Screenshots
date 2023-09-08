

import 'dart:io';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';

/// this function should be called in the context that u wanna start block screenshots form
/// for example: home screen init state
startScreenshotPrevention(){

  if(Platform.isAndroid){
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

}

endScreenshotPrevention(){
  if(Platform.isAndroid){
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

}
## Prevent Screenshots and Screen Recording
.
### To know how can you prevent screenshot and screen recording in you project, just follow the next few steps

### For Android
#### Don't do anything now, just wait for the end, the idea is we are simply using the flutter_windowmanager package to achive that for android
##### just add the pacakge to your dependencies by running this command in project terminal 
    flutter pub add flutter_windowmanager
    
##### just to understand, this code will start the secure mode, 
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
##### and this code to close the secure mode
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);

### For IOS
#### We will write some swift native code to achive that
##### - In this repo go to: Ios/Runner/prevent.swift and copy all
##### - Then Open your project in xcode and go to Runner to create a swift file for example prevent.swift
##### - Past code that you have copied.
##### - Add this line inside your IOS/Runner/AppDelegates.swift
    ScreenRecordHandler.shared.configure()

##### - Your AppDelegate will look like that
     import UIKit
     import Flutter

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {

     // prevent screen shots and records
        ScreenRecordHandler.shared.configure()
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }

    
.
### Finishing
##### - in my repo: go to lib/code/utils/screen_record_shoot_handler
##### - do the same -> create dart file wherever you want indise the lib folder and put this code inside it.
##### - call preventScreenRecord in initState and disposePreventScreenRecord in dispose like that:

    final ScreenRecordHandlerChannel screenRecordHandlerChannel = ScreenRecordHandlerChannel();
   
    @override
     void initState() {
       screenRecordHandlerChannel.preventScreenRecord();
       super.initState();
     }

     @override
     void dispose() {
       screenRecordHandlerChannel.disposePreventScreenRecord();
       super.dispose();
     }

##### Note: Test your app on a real device not on android emulator or ios simulator

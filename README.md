## Prevent Screenshots and Screen Recording

### To learn how to prevent screenshots and screen recording in your project, follow these steps:

### For Android
#### You don't need to do anything right now; just wait until the end. The idea is that we'll simply use the `flutter_windowmanager` package to achieve this for Android.
##### To add the package to your dependencies, run this command in the project terminal:
    flutter pub add flutter_windowmanager
    
##### To understand, this code will enable the secure mode:
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
##### And this code will disable the secure mode:
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);

### For iOS
#### We will write some Swift native code to achieve this.
##### - In this repository, go to: `ios/Runner/prevent.swift` and copy everything.
##### - Then, open your project in Xcode and go to Runner to create a Swift file, for example, `prevent.swift`.
##### - Paste the code that you have copied.
##### - Add this line inside your `ios/Runner/AppDelegate.swift`:
    ScreenRecordHandler.shared.configure()

##### - Your `AppDelegate` will look like this:
     import UIKit
     import Flutter

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {

     // Prevent screenshots and recording
        ScreenRecordHandler.shared.configure()
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }

    
### Finishing
##### - In my repository, go to `lib/code/utils/screen_record_shoot_handler`.
##### - Do the same -> create a Dart file wherever you want inside the `lib` folder and put this code inside it.
##### - Call `preventScreenRecord` in `initState` and `disposePreventScreenRecord` in `dispose` like this:

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

##### Note: Test your app on a real device, not on an Android emulator or iOS simulator.

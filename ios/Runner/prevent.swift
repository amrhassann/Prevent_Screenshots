//
//  prevent.swift
//  Runner
//
//  Created by Amr Hassan on 09/09/2023.
//

import Foundation
import UIKit
import Flutter

class ScreenRecordHandler : NSObject{
    private var appDelegate  = (UIApplication.shared.delegate as? AppDelegate)
    
    weak private var screen : UIView? = nil
    static var shared = ScreenRecordHandler()
    
    
// start configure
    func configure(){
        print("\(#function)")
        
        let controller : FlutterViewController  = appDelegate?.window?.rootViewController as! FlutterViewController
        

        let channel = FlutterMethodChannel(name: "app.flutter.dev/ScreenRecord", binaryMessenger: controller.binaryMessenger)
        
        
        channel.setMethodCallHandler({
            
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // this methid is invoked on the UI thread.
            // handle batter message.
            
            if call.method == "preventScreenRecord"{
                self.preventScreenRecord()
            }else if call.method == "preventScreenRecordDispose"{
                self.preventScreenRecordDispose()
            }else{
                result(FlutterMethodNotImplemented)
            }
            
        })
    }
    
    // end configure

    
    // start screen record hiding content
    var field: UITextField!
    
    func preventScreenRecord(){
        print( "preventScreenRecord" )
        if let keyWindow = UIApplication.shared.keyWindow{
            hideContentOnScreenCapture(isSecure: true, window: keyWindow)
        }
    }
    
    func preventScreenRecordDispose() {
        print ( "preventScreenRecordDispose" )
        if let keywindow = UIApplication.shared.keyWindow {
            hideContentOnScreenCapture(isSecure: false, window: keywindow)
        }
    }
    // end screen record hiding content
    
    
    

    // start Screenshot hiding content
    
    func hideContentOnScreenCapture(isSecure: Bool, window: UIWindow){
        DispatchQueue.main.async {
            if isSecure{
                self.field = UITextField()
                self.field.isSecureTextEntry = true
                window.addSubview(self.field)
                self.field.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
                self.field.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
                window.layer.superlayer?.addSublayer(self.field.layer)
                self.field.layer.sublayers?.first?.addSublayer(window.layer)
            }
            
            
            else{
                if self.field != nil{
                    self.field.isSecureTextEntry = false
                }
            }
            
            
        }
    }
    
    // end Screenshot hiding content

    
}

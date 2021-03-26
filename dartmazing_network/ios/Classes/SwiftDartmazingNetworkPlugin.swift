import Flutter
import UIKit

public class SwiftDartmazingNetworkPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dartmazing_network", binaryMessenger: registrar.messenger())
        let instance = SwiftDartmazingNetworkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "performNativeRequest":
            let json = call.arguments as? [String: Any] ?? [:]
            if let requestNative = RequestNative(json: json) {
                Network().fetch(requestNative: requestNative, onSuccess: { (response) in
                    result(response)
                }, onFailure: { (error) in
                    result(error.flutterError)
                })
                
            } else {
                result(RequestError.unknownError.flutterError)
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

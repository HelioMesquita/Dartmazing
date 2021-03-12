#import "DartmazingNetworkPlugin.h"
#if __has_include(<dartmazing_network/dartmazing_network-Swift.h>)
#import <dartmazing_network/dartmazing_network-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dartmazing_network-Swift.h"
#endif

@implementation DartmazingNetworkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDartmazingNetworkPlugin registerWithRegistrar:registrar];
}
@end

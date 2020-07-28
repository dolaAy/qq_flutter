#import "QqFlutterPlugin.h"
#if __has_include(<qq_flutter/qq_flutter-Swift.h>)
#import <qq_flutter/qq_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "qq_flutter-Swift.h"
#endif

@implementation QqFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQqFlutterPlugin registerWithRegistrar:registrar];
}
@end

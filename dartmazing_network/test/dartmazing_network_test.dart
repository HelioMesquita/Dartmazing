import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:dartmazing_network/dartmazing_network.dart';

void main() {
  const MethodChannel channel = MethodChannel('dartmazing_network');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await DartmazingNetwork.platformVersion, '42');
  });
}

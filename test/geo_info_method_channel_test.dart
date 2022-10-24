import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geo_info/geo_info_method_channel.dart';

void main() {
  MethodChannelGeoInfo platform = MethodChannelGeoInfo();
  const MethodChannel channel = MethodChannel('geo_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}

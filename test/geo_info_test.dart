import 'package:flutter_test/flutter_test.dart';
import 'package:geo_info/geo_info.dart';
import 'package:geo_info/geo_info_platform_interface.dart';
import 'package:geo_info/geo_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGeoInfoPlatform
    with MockPlatformInterfaceMixin
    implements GeoInfoPlatform {

  @override
  Future<String?> getCurrencyCode() {
    // TODO: implement getCurrencyCode
    throw UnimplementedError();
  }

  @override
  Future<String?> getCurrencySymbol() {
    // TODO: implement getCurrencySymbol
    throw UnimplementedError();
  }

  @override
  Future<String?> getDialingCode() {
    // TODO: implement getDialingCode
    throw UnimplementedError();
  }

  @override
  Future<String?> getFriendlyName() {
    // TODO: implement getFriendlyName
    throw UnimplementedError();
  }

  @override
  Future<String?> getISO2() {
    // TODO: implement getISO2
    throw UnimplementedError();
  }

  @override
  Future<String?> getISO3() {
    // TODO: implement getISO3
    throw UnimplementedError();
  }

  @override
  Future<String?> getId() {
    // TODO: implement getId
    throw UnimplementedError();
  }

  @override
  Future<String?> getIosUnNumber() {
    // TODO: implement getIosUnNumber
    throw UnimplementedError();
  }

  @override
  Future<String?> getLCID() {
    // TODO: implement getLCID
    throw UnimplementedError();
  }

  @override
  Future<String?> getLatitude() {
    // TODO: implement getLatitude
    throw UnimplementedError();
  }

  @override
  Future<String?> getLongitude() {
    // TODO: implement getLongitude
    throw UnimplementedError();
  }

  @override
  Future<String?> getName() {
    // TODO: implement getName
    throw UnimplementedError();
  }

  @override
  Future<String?> getNation() {
    // TODO: implement getNation
    throw UnimplementedError();
  }

  @override
  Future<String?> getOfficialLanguages() {
    // TODO: implement getOfficialLanguages
    throw UnimplementedError();
  }

  @override
  Future<String?> getOfficialName() {
    // TODO: implement getOfficialName
    throw UnimplementedError();
  }

  @override
  Future<String?> getParent() {
    // TODO: implement getParent
    throw UnimplementedError();
  }

  @override
  Future<String?> getRFC1766() {
    // TODO: implement getRFC1766
    throw UnimplementedError();
  }

  @override
  Future<String?> getTimezone() {
    // TODO: implement getTimezone
    throw UnimplementedError();
  }

  @override
  Future<String?> getInfoTimezone() {
    // TODO: implement getInfoTimezone
    throw UnimplementedError();
  }

  @override
  Future<String?> getLocaleName() {
    // TODO: implement getLocaleName
    throw UnimplementedError();
  }

  @override
  Future<String?> getGeoDeviceWinrt() {
    // TODO: implement getGeoDeviceWinrt
    throw UnimplementedError();
  }
}

void main() {
  final GeoInfoPlatform initialPlatform = GeoInfoPlatform.instance;

  test('$MethodChannelGeoInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGeoInfo>());
  });

  test('getPlatformVersion', () async {
    GeoInfo geoInfoPlugin = GeoInfo();
    MockGeoInfoPlatform fakePlatform = MockGeoInfoPlatform();
    GeoInfoPlatform.instance = fakePlatform;

    expect(await geoInfoPlugin.getCurrencyCode(), 'R\$');
  });
}

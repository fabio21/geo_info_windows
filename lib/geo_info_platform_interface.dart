import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'geo_info_method_channel.dart';

abstract class GeoInfoPlatform extends PlatformInterface {
  /// Constructs a GeoInfoPlatform.
  GeoInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static GeoInfoPlatform _instance = MethodChannelGeoInfo();

  /// The default instance of [GeoInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelGeoInfo].
  static GeoInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GeoInfoPlatform] when
  /// they register themselves.
  static set instance(GeoInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///DEPRECATED Not used by name API
  Future<String?> getNation() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getLatitude() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getLongitude() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getISO2() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getISO3() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///DEPRECATED and misleading, not used by name API
  Future<String?> getRFC1766() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///DEPRECATED Not used by name API
  Future<String?> getLCID() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getFriendlyName() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getOfficialName() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///Not implemented
  Future<String?> getTimezone() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///Not implemented
  Future<String?> getOfficialLanguages() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getIosUnNumber() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getParent() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// return: [55]
  Future<String?> getDialingCode() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// return: [USD]
  Future<String?> getCurrencyCode() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Return: [$]
  Future<String?> getCurrencySymbol() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getName() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// DEPRECATED - For compatibility, please avoid
  Future<String?> getId() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getLocaleName() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getInfoTimezone() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getGeoDeviceWinrt() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> permissionGeoWinrt() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> activateLocation() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

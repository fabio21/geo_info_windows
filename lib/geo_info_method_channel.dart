import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'geo_info_platform_interface.dart';

/// An implementation of [GeoInfoPlatform] that uses method channels.
class MethodChannelGeoInfo extends GeoInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('geo_info');

  @override
  Future<String?> getCurrencyCode() async {
    return await methodChannel.invokeMethod<String>('getCurrencyCode');
  }

  @override
  Future<String?> getCurrencySymbol() async {
   return await methodChannel.invokeMethod<String>('getCurrencySymbol');
  }

  @override
  Future<String?> getDialingCode() async {
    return await methodChannel.invokeMethod<String>('getDialingCode');
  }

  @override
  Future<String?> getFriendlyName() async {
    final version = await methodChannel.invokeMethod<String>('getFriendlyName');
    return version;
  }

  @override
  Future<String?> getISO2() async {
    final version = await methodChannel.invokeMethod<String>('getISO2');
    return version;
  }

  @override
  Future<String?> getISO3() async {
    final version = await methodChannel.invokeMethod<String>('getISO3');
    return version;
  }

  @override
  Future<String?> getId() async {
    final version = await methodChannel.invokeMethod<String>('getId');
    return version;
  }

  @override
  Future<String?> getIosUnNumber() async {
    final version = await methodChannel.invokeMethod<String>('getIosUnNumber');
    return version;
  }

  @override
  Future<String?> getLCID() async {
    final version = await methodChannel.invokeMethod<String>('getLCID');
    return version;
  }

  @override
  Future<String?> getLatitude() async {
    final version = await methodChannel.invokeMethod<String>('getLatitude');
    return version;
  }

  @override
  Future<String?> getLongitude() async {
    final version = await methodChannel.invokeMethod<String>('getLongitude');
    return version;
  }

  @override
  Future<String?> getName() async {
    final version = await methodChannel.invokeMethod<String>('getName');
    return version;
  }

  @override
  Future<String?> getNation() async {
    final version = await methodChannel.invokeMethod<String>('getNation');
    return version;
  }

  @override
  Future<String?> getOfficialLanguages() async {
    final version =
        await methodChannel.invokeMethod<String>('getOfficialLanguages');
    return version;
  }

  @override
  Future<String?> getOfficialName() async {
    final version = await methodChannel.invokeMethod<String>('getOfficialName');
    return version;
  }

  @override
  Future<String?> getParent() async {
    final version = await methodChannel.invokeMethod<String>('getParent');
    return version;
  }

  @override
  Future<String?> getRFC1766() async {
    final version = await methodChannel.invokeMethod<String>('getRFC1766');
    return version;
  }

  @override
  Future<String?> getTimezone() async {
    final version = await methodChannel.invokeMethod<String>('getTimezone');
    return version;
  }

  @override
  Future<String?> getInfoTimezone() async {
    return await methodChannel.invokeMethod<String>('getInfoTimezone');
  }

  @override
  Future<String?> getLocaleName() async {
    return await methodChannel.invokeMethod<String>('getLocaleName');
  }
}

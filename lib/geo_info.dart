import 'dart:convert';

import 'package:geo_info/geolocation_device.dart';
import 'package:geo_info/model_timezone.dart';
import 'package:geo_info/timezone_name.dart';

import 'geo_info_platform_interface.dart';

class GeoInfo {
  ///DEPRECATED Not used by name API
  Future<String?> getNation() async {
    return await GeoInfoPlatform.instance.getNation();
  }

  /// return:  example -10.808
  /// not accurate in the information relating
  Future<String?> getLatitude() async {
    return await GeoInfoPlatform.instance.getLatitude();
  }

  /// return:  example -52.975
  /// not accurate in the information relating
  Future<String?> getLongitude() async {
    return await GeoInfoPlatform.instance.getLongitude();
  }

  /// return:  example BR
  Future<String?> getISO2() async {
    return await GeoInfoPlatform.instance.getISO2();
  }

  /// return:  example BR
  Future<String?> getISO3() async {
    return await GeoInfoPlatform.instance.getISO2();
  }

  ///DEPRECATED and misleading, not used by name API
  Future<String?> getRFC1766() async {
    return await GeoInfoPlatform.instance.getRFC1766();
  }

  ///DEPRECATED Not used by name API
  Future<String?> getLCID() async {
    return await GeoInfoPlatform.instance.getLCID();
  }

  /// return:example Brasil
  Future<String?> getFriendlyName() async {
    return await GeoInfoPlatform.instance.getFriendlyName();
  }

  /// return:  example República Federativa do Brasil
  Future<String?> getOfficialName() async {
    return await GeoInfoPlatform.instance.getOfficialName();
  }

  ///Not implemented
  Future<String?> getTimezone() async {
    return await GeoInfoPlatform.instance.getTimezone();
  }

  ///Not implemented
  Future<String?> getOfficialLanguages() async {
    return await GeoInfoPlatform.instance.getOfficialLanguages();
  }

  ///return  example 076
  Future<String?> getIosUnNumber() async {
    return await GeoInfoPlatform.instance.getIosUnNumber();
  }

  /// return  example 31396
  Future<String?> getParent() async {
    return await GeoInfoPlatform.instance.getParent();
  }

  /// return example 55
  Future<String?> getDialingCode() async {
    return await GeoInfoPlatform.instance.getDialingCode();
  }

  /// return:  example BRL
  Future<String?> getCurrencyCode() async {
    return await GeoInfoPlatform.instance.getCurrencyCode();
  }

  /// return example R$
  Future<String?> getCurrencySymbol() async {
    return await GeoInfoPlatform.instance.getCurrencySymbol();
  }

  /// return example R$ BR
  Future<String?> getName() async {
    return await GeoInfoPlatform.instance.getName();
  }

  /// DEPRECATED - For compatibility, please avoid
  /// ID: 1046
  Future<String?> getId() async {
    return await GeoInfoPlatform.instance.getId();
  }

  /// TimezoneInfo
  ///  NAME: Hora oficial do Brasil,
  ///  TIMEZONE - NAME: E. South America Standard Time,
  ///  TIMEZONES: [Brasília] as LIST
  ///  UTC: -3
  ///  DATETIME: 2022-10-24T09:49:41.000
  ///  TIME: 09:49:41
  ///  DAY: 24
  ///  Month: 10
  ///  YEAR: 2022
  ///  YEAR: 2022
  Future<TimezoneInfo?> getInfoTimezone() async {
    String? map = await GeoInfoPlatform.instance.getInfoTimezone();
    try {
      var json = jsonDecode(map!);
      var info = TimezoneInfo.fromJson(json);
      dynamic zone = timeZoneInfoMap[info.timeZoneName]?["zone"] ?? [];
      info.timeZones = zone;
      return info;
    } catch (e) {
      throw e.toString();
      //return null;
    }
  }

  /// example pt-BR
  Future<String?> getLocaleName() async {
    return await GeoInfoPlatform.instance.getLocaleName();
  }

  /// Windows.Devices.Geolocation  latitude and longitude
  /// GPS : within approximately 10 meters
  /// Wi-Fi : between approximately 30 meters and 500 meters
  /// Cell towers : between approximately 300 meters and 3,000 meters
  /// IP address : between approximately 1,000 meters and 5,000 meters
  Future<Geolocation?> getGeoDeviceWinrt() async {
    String? map = await GeoInfoPlatform.instance.getGeoDeviceWinrt();
    try {
      var json = jsonDecode(map!);
      return Geolocation.fromJson(json);
    } catch (e) {
      throw e.toString();
    }
  }
}

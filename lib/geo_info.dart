import 'dart:convert';

import 'package:geo_info/model_timezone.dart';
import 'package:geo_info/timezone_name.dart';

import 'geo_info_platform_interface.dart';

class GeoInfo {

  ///DEPRECATED Not used by name API
  Future<String?> getNation() async {
    return await GeoInfoPlatform.instance.getNation();
  }
  /// return:  exemple -10.808
  /// not accurate in the information relating
  Future<String?> getLatitude() async {
    return await GeoInfoPlatform.instance.getLatitude();
  }
  /// return:  exemple -52.975
  /// not accurate in the information relating
  Future<String?> getLongitude() async{
    return await GeoInfoPlatform.instance.getLongitude();
  }
  /// return:  exemple BR
  Future<String?> getISO2() async{
    return await GeoInfoPlatform.instance.getISO2();
  }

  /// return:  exemple BR
  Future<String?> getISO3() async{
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
  /// return:exemple Brasil
  Future<String?> getFriendlyName() async {
    return await GeoInfoPlatform.instance.getFriendlyName();
  }
  /// return:  exemple República Federativa do Brasil
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
  ///return  exemple 076
  Future<String?> getIosUnNumber() async {
    return await GeoInfoPlatform.instance.getIosUnNumber();
  }
  /// return  exemple 31396
  Future<String?> getParent() async {
    return await GeoInfoPlatform.instance.getParent();
  }
  /// return exemple 55
  Future<String?> getDialingCode() async {
    return await GeoInfoPlatform.instance.getDialingCode();
  }

  /// return:  exemple BRL
  Future<String?> getCurrencyCode() async {
    return await GeoInfoPlatform.instance.getCurrencyCode();
  }
  /// return exemple R$
  Future<String?> getCurrencySymbol()  async {
    return await GeoInfoPlatform.instance.getCurrencySymbol();
  }
 /// return exemple R$ BR
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
  ///  Fuso Name: [Brasília] as LIST
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
      dynamic zone =  TimezoneInfoMap[info.timeZoneName]?["zone"] ?? [];
      info.fusoHorarioName = zone;
      return info;
    }catch (e){
      throw e.toString();
      return null;
    }
  }
  
  Future<String?> getLocaleName() async {
    return await GeoInfoPlatform.instance.getLocaleName();
  }
}

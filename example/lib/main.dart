import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_info/geo_info.dart';
import 'package:geo_info/geolocation_device.dart';
import 'package:geo_info/model_timezone.dart';
//import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;

const geoInfo = [
  "GEO_NATION",
  "GEO_LATITUDE",
  "GEO_LONGITUDE",
  "GEO_ISO2",
  "GEO_ISO3",
  "GEO_RFC1766",
  "GEO_LCID",
  "GEO_FRIENDLYNAME",
  "GEO_OFFICIALNAME",
  "GEO_TIMEZONES",
  "GEO_OFFICIALLANGUAGES",
  "GEO_ISO_UN_NUMBER",
  "GEO_PARENT",
  "GEO_DIALINGCODE",
  "GEO_CURRENCYCODE",
  "GEO_CURRENCYSYMBOL",
  "GEO_NAME",
  "GEO_ID",
  "GET_INFO_TIMEZONE",
  "GET_LOCALE_NAME",
  "GET_GEO_DEVICE_WIN_RT"
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _geoInfoPlugin = GeoInfo();

  List<Widget> list = [];
  late num latitude, longitude;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      for (var s in geoInfo) {
        var value = await getValue(s);
        list.addAll(value);
      }
      platformVersion =
          await _geoInfoPlugin.getLatitude() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    //String tz = tzmap.latLngToTimezoneString(latitude, longitude);
   // log('TimeZone $tz.');
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion.trim();
    });
  }

  Future<List<Widget>> getValue(String type) async {
    String value = "";
    switch (type) {
      case "GEO_NATION":
        value = await _geoInfoPlugin.getNation() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_LATITUDE":
        value = await _geoInfoPlugin.getLatitude() ?? "N/A";
        // latitude = num.parse(value);
        return [getInfo(type, value)];
      case "GEO_LONGITUDE":
        value = await _geoInfoPlugin.getLongitude() ?? "N/A";
        // longitude = num.parse(value);
         return [getInfo(type, value)];
      case "GEO_ISO2":
        value = await _geoInfoPlugin.getISO2() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_ISO3":
        value = await _geoInfoPlugin.getISO3() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_RFC1766":
        value = await _geoInfoPlugin.getRFC1766() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_LCID":
        value = await _geoInfoPlugin.getLCID() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_FRIENDLYNAME":
        value = await _geoInfoPlugin.getFriendlyName() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_OFFICIALNAME":
        value = await _geoInfoPlugin.getOfficialName() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_TIMEZONES":
        value = await _geoInfoPlugin.getTimezone() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_OFFICIALLANGUAGES":
        value = await _geoInfoPlugin.getOfficialLanguages() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_ISO_UN_NUMBER":
        value = await _geoInfoPlugin.getIosUnNumber() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_PARENT":
        value = await _geoInfoPlugin.getParent() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_DIALINGCODE":
        value = await _geoInfoPlugin.getDialingCode() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_CURRENCYCODE":
        value = await _geoInfoPlugin.getCurrencyCode() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_CURRENCYSYMBOL":
        value = await _geoInfoPlugin.getCurrencySymbol() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_NAME":
        value = await _geoInfoPlugin.getName() ?? "N/A";
        return [getInfo(type, value)];
      case "GEO_ID":
        value = await _geoInfoPlugin.getId() ?? "N/A";
        return [getInfo(type, value)];
      case "GET_INFO_TIMEZONE":
        TimezoneInfo s =
            await _geoInfoPlugin.getInfoTimezone() ?? TimezoneInfo();
        return [
          getInfo("ID", s.id?.toString() ?? "N/A"),
          getInfo("NAME", s.name ?? "N/A"),
          getInfo("TIMEZONE - NAME", s.timeZoneName ?? "N/A"),
          getInfo("TIMEZONES", s.timeZones?.toString() ?? "N/A"),
          getInfo("UTC", s.utc?.toString() ?? "N/A"),
          getInfo("DATETIME", s.datetime?.toIso8601String() ?? "N/A"),
          getInfo("TIME", s.time ?? "N/A"),
          getInfo("DAY", s.day?.toString() ?? "N/A"),
          getInfo("Month", s.month?.toString() ?? "N/A"),
          getInfo("YEAR", s.year?.toString() ?? "N/A"),
        ];
      case "GET_LOCALE_NAME":
        value = await _geoInfoPlugin.getLocaleName() ?? "N/A";
        return [getInfo(type, value)];
      case "GET_GEO_DEVICE_WIN_RT":
       Geolocation? geo = await _geoInfoPlugin.getGeoDeviceWinrt();
       if(geo != null){
         latitude = num.parse(geo.latitude.toString());
         longitude = num.parse(geo.longitude.toString());
         return[
           getInfo("Latitude Device", geo.latitude?.toString() ?? "N/A"),
           getInfo("Longitude Device", geo.longitude?.toString() ?? "N/A"),
         ];
       }
        return [getInfo(type, value)];
      default:
        return [getInfo(type, "Default")];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: list.isEmpty
            ? Center(
                child: SelectableText('Running on: $_platformVersion\n'),
              )
            : ListView(
                padding: const EdgeInsets.all(16),
                children: list,
              ),
      ),
    );
  }

  Widget getInfo(String name, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      color: Colors.black12,
      child: SelectableText.rich(
        TextSpan(
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
          children: [
            TextSpan(
              text: "$name: ",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

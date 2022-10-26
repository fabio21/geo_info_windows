#include "geo_info_plugin.h"

// This must be included before many other Windows headers.
#include <Windows.h>
// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <memory>
#include <sstream>
#include <atlstr.h>
#include <cstddef>
#include <algorithm>

#include <vector>
#include <algorithm>
#include <cstddef>
#include <sstream>
#include <codecvt>
#include <iostream>
#include <fstream>
#include <coroutine>

#include <winrt/Windows.Devices.Geolocation.h>
#include <winrt/Windows.foundation.h>
#include <winrt/base.h>
#include <map>
#include <winrt/windows.system.h>

#include <future>

using namespace winrt;
using namespace Windows::Foundation;
using namespace Windows::Devices::Geolocation;
std::condition_variable cv;

std::wstring string_to_wide_string(const std::string &string)
{
  if (string.empty())
  {
    return L"";
  }

  const auto size_needed = MultiByteToWideChar(CP_UTF8, 0, &string.at(0), (int)string.size(), nullptr, 0);
  if (size_needed <= 0)
  {
    throw std::runtime_error("MultiByteToWideChar() failed: " + std::to_string(size_needed));
  }

  std::wstring result(size_needed, 0);
  MultiByteToWideChar(CP_UTF8, 0, &string.at(0), (int)string.size(), &result.at(0), size_needed);
  return result;
}

std::string wide_string_to_string(const std::wstring &wide_string)
{
  if (wide_string.empty())
  {
    return "";
  }

  const auto size_needed = WideCharToMultiByte(CP_UTF8, 0, &wide_string.at(0), (int)wide_string.size(), nullptr, 0, nullptr, nullptr);
  if (size_needed <= 0)
  {
    throw std::runtime_error("WideCharToMultiByte() failed: " + std::to_string(size_needed));
  }

  std::string result(size_needed, 0);
  WideCharToMultiByte(CP_UTF8, 0, &wide_string.at(0), (int)wide_string.size(), &result.at(0), size_needed, nullptr, nullptr);
  return result;
}

std::string toMapString(std::map<std::string, double> value)
{
  std::stringstream stream;
  stream << "{";
  size_t count = value.size();
  int last = 1;
  for (auto pair : value)
  {
    stream << '"' << pair.first << '"' << ": " << '"' << pair.second << '"';

    if (count > last)
      stream << ", ";

    last++;
  }

  stream << "}";

  return stream.str();
}

concurrency::task<std::string> GeoDeviceWinrt()
{

  return concurrency::create_task([]
                                  {
        auto geo = Geolocator();
        TimeSpan timeMax = std::chrono::milliseconds{10 };
        TimeSpan timeOut = std::chrono::milliseconds{ 60000 };

        Geoposition location{ geo.GetGeopositionAsync(timeMax, timeOut).get()};
      
        Geocoordinate coordinate = location.Coordinate();
        std::map<std::string, double> value;
        value.insert(std::pair<std::string, double>("latitude", coordinate.Latitude()));
        value.insert(std::pair<std::string, double>("longitude", coordinate.Longitude()));

       return toMapString(value); });
}

std::string GetLocaleName()
{
  WCHAR lpLocaleName[100];
  if (GetUserDefaultLocaleName(lpLocaleName, LOCALE_NAME_MAX_LENGTH) != ERROR_INSUFFICIENT_BUFFER)
  {
    return wide_string_to_string(lpLocaleName);
  }
  return "null";
}

std::string GetInfoTimezone()
{

  std::stringstream stream;

  LANGID id = GetUserDefaultLangID();
  DYNAMIC_TIME_ZONE_INFORMATION d_tz;
  DWORD dwIndex = GetDynamicTimeZoneInformation(&d_tz);

  if (dwIndex == TIME_ZONE_ID_STANDARD || dwIndex == TIME_ZONE_ID_UNKNOWN)
    std::wcout << L"TIME_ZONE_ID_STANDARD: " << std::endl;
  else if (dwIndex == TIME_ZONE_ID_DAYLIGHT)
    std::wcout << L"TIME_ZONE_ID_DAYLIGHT: " << std::endl;
  else
  {
    printf("GTZI failed (%lu)\n", GetLastError());
  }

  SYSTEMTIME st = {0};
  SYSTEMTIME lt = {0};
  GetSystemTime(&st);
  GetLocalTime(&lt);
  SystemTimeToTzSpecificLocalTimeEx(&d_tz, &st, &lt);
  WCHAR time[250] = {0};

  GetTimeFormatEx(LOCALE_NAME_USER_DEFAULT, 0, &lt, L"HH':'mm':'ss tt", time, 250);

  std::string year = std::to_string((unsigned short)lt.wYear);
  std::string month = std::to_string((unsigned short)lt.wMonth);
  std::string day = std::to_string((unsigned short)lt.wDay);
  std::string timeE = wide_string_to_string(time);
  std::string datetime = year + "-" + month + "-" + day + " " + timeE;

  std::map<std::string, std::string> value;

  value.insert(std::pair<std::string, std::string>("id", std::to_string((unsigned short)id)));
  value.insert(std::pair<std::string, std::string>("name", wide_string_to_string(d_tz.StandardName)));
  value.insert(std::pair<std::string, std::string>("time_zone_name", wide_string_to_string(d_tz.TimeZoneKeyName)));
  value.insert(std::pair<std::string, std::string>("time", wide_string_to_string(time)));
  value.insert(std::pair<std::string, std::string>("datetime", datetime));
  value.insert(std::pair<std::string, std::string>("year", year));
  value.insert(std::pair<std::string, std::string>("month", month));
  value.insert(std::pair<std::string, std::string>("day", day));
  value.insert(std::pair<std::string, std::string>("utc", std::to_string((unsigned short)d_tz.Bias / d_tz.DaylightBias)));

  stream << "{";
  size_t count = value.size();
  int last = 1;
  for (auto pair : value)
  {
    stream << '"' << pair.first << '"' << ": " << '"' << pair.second << '"';

    if (count > last)
      stream << ", ";

    last++;
  }

  stream << "}";

  return stream.str();
}

std::string GeoInfo(int sysGeo)
{

  GEOID myGEO = GetUserGeoID(GEOCLASS_NATION);
  // LCID lcid = GetUserDefaultLCID();
  int sizeOfBuffer = GetGeoInfo(myGEO, sysGeo, NULL, 0, 0);
  TCHAR *outStr = new TCHAR[sizeOfBuffer];
  GetGeoInfo(myGEO, sysGeo, outStr, sizeOfBuffer, LANG_SYSTEM_DEFAULT);
  std::string value = wide_string_to_string(outStr);
  delete[] outStr;
  return value;
  ;
}

std::string GeoInfoEX(int sysGeo)
{
  GEOID myGEO = GetUserGeoID(GEOCLASS_NATION);
  int sizeOfBuffer = GetGeoInfo(myGEO, GEO_ID, NULL, 0, LANG_USER_DEFAULT);
  WCHAR *id = new WCHAR[sizeOfBuffer];

  int size = GetGeoInfo(myGEO, sysGeo, id, sizeOfBuffer, LANG_USER_DEFAULT);
  TCHAR *outStr = new TCHAR[size];

  GetGeoInfoEx(id, sysGeo, outStr, 0);
  std::string value = wide_string_to_string(outStr);
  delete[] outStr;
  return value;
}

namespace geo_info
{

  // static
  void GeoInfoPlugin::RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "geo_info",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<GeoInfoPlugin>();

    channel->SetMethodCallHandler([plugin_pointer = plugin.get()](const auto &call, auto result)
                                  { plugin_pointer->HandleMethodCall(call, std::move(result)); });

    registrar->AddPlugin(std::move(plugin));
  }

  GeoInfoPlugin::GeoInfoPlugin() {}

  GeoInfoPlugin::~GeoInfoPlugin() {}

  void GeoInfoPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    std::ostringstream inStr;
    inStr << nullptr;
    // std::wstring value;
    if (method_call.method_name().compare("getNation") == 0)
    {
     result->Success(flutter::EncodableValue("DEPRECATED Not used by name API"));
    }
    else if (method_call.method_name().compare("getLatitude") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_LATITUDE)));
    }
    else if (method_call.method_name().compare("getLongitude") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_LONGITUDE)));
    }
    else if (method_call.method_name().compare("getISO2") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_ISO2)));
    }
    else if (method_call.method_name().compare("getISO3") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_ISO3)));
    }
    else if (method_call.method_name().compare("getRFC1766") == 0)
    {
      result->Success(flutter::EncodableValue("DEPRECATED and misleading, not used by name API"));
    }
    else if (method_call.method_name().compare("getLCID") == 0)
    {
      result->Success(flutter::EncodableValue("DEPRECATED Not used by name API"));
    }
    else if (method_call.method_name().compare("getFriendlyName") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_FRIENDLYNAME)));
    }
    else if (method_call.method_name().compare("getOfficialName") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_OFFICIALNAME)));
    }
    else if (method_call.method_name().compare("getTimezone") == 0)
    {
      result->Success(flutter::EncodableValue("Not implemented."));
      // result->Success(flutter::EncodableValue(GeoInfo(GEO_TIMEZONES)));
    }
    else if (method_call.method_name().compare("getOfficialLanguages") == 0)
    {
      result->Success(flutter::EncodableValue("Not implemented."));
      // result->Success(flutter::EncodableValue(GeoInfo(GEO_OFFICIALLANGUAGES)));
    }
    else if (method_call.method_name().compare("getIosUnNumber") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_ISO_UN_NUMBER)));
    }
    else if (method_call.method_name().compare("getParent") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_PARENT)));
    }
    else if (method_call.method_name().compare("getDialingCode") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_DIALINGCODE)));
    }
    else if (method_call.method_name().compare("getCurrencyCode") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_CURRENCYCODE)));
    }
    else if (method_call.method_name().compare("getCurrencySymbol") == 0)
    {

      result->Success(flutter::EncodableValue(GeoInfo(GEO_CURRENCYSYMBOL)));
    }
    else if (method_call.method_name().compare("getName") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_NAME)));
    }
    else if (method_call.method_name().compare("getId") == 0)
    {
      result->Success(flutter::EncodableValue(GeoInfo(GEO_ID)));
    }
    else if (method_call.method_name().compare("getInfoTimezone") == 0)
    {
      result->Success(flutter::EncodableValue(GetInfoTimezone()));
    }
    else if (method_call.method_name().compare("getLocaleName") == 0)
    {
      result->Success(flutter::EncodableValue(GetLocaleName()));
    }
    else if (method_call.method_name().compare("getGeoDeviceWinrt") == 0)
    {
      auto json{GeoDeviceWinrt()};
      auto j = json.get();
      result->Success(flutter::EncodableValue(j));
    }
    else
    {
      result->NotImplemented();
    }

    //   result->Success(flutter::EncodableValue(inStr.str()));
  };

} // namespace geo_info
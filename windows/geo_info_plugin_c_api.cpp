#include "include/geo_info/geo_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "geo_info_plugin.h"

void GeoInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  geo_info::GeoInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

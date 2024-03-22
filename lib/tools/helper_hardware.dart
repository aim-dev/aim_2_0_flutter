
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HelperHardware {

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();


  static Future<String> readDeviceUniqueId() async {
    return await MobileDeviceIdentifier().getDeviceId() ?? 'unknown';
  }

  static Future<String> readAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    return version;
  }

  static Future<String> readDeviceModel() async {
    if( Platform.isIOS ) {
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
      return info.model;
    }
    AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    return info.model;
  }

  static Future<Map<String, dynamic>> _readAndroidDeviceInfo() async {

    AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;

    return <String, dynamic>{
      'version.securityPatch': info.version.securityPatch,
      'version.sdkInt': info.version.sdkInt,
      'version.release': info.version.release,
      'version.previewSdkInt': info.version.previewSdkInt,
      'version.incremental': info.version.incremental,
      'version.codename': info.version.codename,
      'version.baseOS': info.version.baseOS,
      'board': info.board,
      'bootloader': info.bootloader,
      'brand': info.brand,
      'device': info.device,
      'display': info.display,
      'fingerprint': info.fingerprint,
      'hardware': info.hardware,
      'host': info.host,
      'id': info.id,
      'manufacturer': info.manufacturer,
      'model': info.model,
      'product': info.product,
      'supported32BitAbis': info.supported32BitAbis,
      'supported64BitAbis': info.supported64BitAbis,
      'supportedAbis': info.supportedAbis,
      'tags': info.tags,
      'type': info.type,
      'isPhysicalDevice': info.isPhysicalDevice,
      'systemFeatures': info.systemFeatures,
      'displaySizeInches':
      ((info.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': info.displayMetrics.widthPx,
      'displayWidthInches': info.displayMetrics.widthInches,
      'displayHeightPixels': info.displayMetrics.heightPx,
      'displayHeightInches': info.displayMetrics.heightInches,
      'displayXDpi': info.displayMetrics.xDpi,
      'displayYDpi': info.displayMetrics.yDpi,
      'serialNumber': info.serialNumber,
    };
  }

  static Future<Map<String, dynamic>> _readIosDeviceInfo() async {

    IosDeviceInfo info = await deviceInfoPlugin.iosInfo;

    return <String, dynamic>{
      'name': info.name,
      'systemName': info.systemName,
      'systemVersion': info.systemVersion,
      'model': info.model,
      'localizedModel': info.localizedModel,
      'identifierForVendor': info.identifierForVendor,
      'isPhysicalDevice': info.isPhysicalDevice,
      'utsname.sysname:': info.utsname.sysname,
      'utsname.nodename:': info.utsname.nodename,
      'utsname.release:': info.utsname.release,
      'utsname.version:': info.utsname.version,
      'utsname.machine:': info.utsname.machine,
    };
  }
}
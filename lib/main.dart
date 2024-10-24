import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_manager/app/customs/app_util.dart';
import 'package:pet_manager/app/customs/color_tool.dart';

import 'app/customs/pet_bind.dart';
import 'app/modules/detailList/detail_list_binding.dart';
import 'app/modules/detailList/detail_list_view.dart';
import 'app/modules/detailList/list_mo/list_mo_binding.dart';
import 'app/modules/detailList/list_mo/list_mo_view.dart';
import 'app/modules/detail_page/bindings/detail_page_binding.dart';
import 'app/modules/detail_page/views/detail_page_view.dart';
import 'app/modules/mine/mine_binding.dart';
import 'app/modules/mine/mine_view.dart';
import 'app/modules/pet_add/pet_add_binding.dart';
import 'app/modules/pet_add/pet_add_view.dart';
import 'app/modules/pet_list/bindings/pet_list_binding.dart';
import 'app/modules/pet_list/views/pet_list_view.dart';
import 'app/modules/root_page/bindings/root_page_binding.dart';
import 'app/modules/root_page/views/root_page_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("en", "US"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: Des,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: PMColorUitl.pmGetColor("#F2F2F2"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();
  
  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();
  
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              PMAppUtil.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}

List<GetPage<dynamic>> Des = [
  GetPage(
    name: '/',
    page: () => const ListMoView(),
    binding: ListMoBinding(),
  ),
  GetPage(
    name: '/detail-list',
    page: () => const DetailListView(),
    binding: DetailListBinding(),
  ),
  GetPage(
    name: '/pet-add',
    page: () => const PetAddView(),
    binding: PetAddBinding(),
  ),
  GetPage(
    name: '/pet-bing',
    page: () => const PetBind(),
  ),
  GetPage(
    name: '/mine',
    page: () => const MineView(),
    binding: MineBinding(),
  ),
  GetPage(
    name: '/root-page',
    page: () => const RootPageView(),
    binding: RootPageBinding(),
  ),
  GetPage(
    name: '/pet-list',
    page: () => const PetListView(),
    binding: PetListBinding(),
  ),
  GetPage(
    name: '/detail-page',
    page: () => const DetailPageView(),
    binding: DetailPageBinding(),
  ),
];

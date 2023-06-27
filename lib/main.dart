import 'package:firebase_core/firebase_core.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth.dart';
import 'app/services/storage.dart';
import 'firebase_options.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  return runApp(GetMaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    defaultTransition: Transition.noTransition,
    smartManagement: SmartManagement.full,
    locale: const Locale('en', 'US'),
    translationsKeys: AppTranslation.translations,
    debugShowCheckedModeBanner: false,
    title: "Ticket Checker",
    initialRoute: AppPages.INITIAL,
    initialBinding: HomeBinding(),
    getPages: AppPages.routes,
  ));
}

Future<void> initGetServices() async {
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}

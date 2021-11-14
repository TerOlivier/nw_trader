import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nw_trader/controllers/app_controller.dart';
import 'package:nw_trader/controllers/auth_controller.dart';

import 'package:nw_trader/services/theme_services.dart';
import 'package:nw_trader/ui/pages/authentication/authentication_page.dart';
import 'package:nw_trader/ui/pages/home/home_page.dart';

import 'ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().then((value) {
    Get.put(AppController());
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: HomePage(),
    );
  }
}

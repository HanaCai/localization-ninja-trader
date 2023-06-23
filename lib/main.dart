import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localization/view/home_screen.dart';
import 'package:localization/controller/localization_controller.dart';
import 'package:localization/utils/string.dart';
import 'package:localization/model/translation.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var localDB =  GetStorage();
  LanguageController languageController = Get.put(LanguageController());

  @override
  void initState() {
    setLanguage();
    super.initState();
  }

  setLanguage() async {
    String language = await localDB.read(Strings.language) ?? Strings.english;
    if(language == null){
      Get.updateLocale(const Locale('en', 'US'));
      languageController.selectedLanguage.value = Strings.english;
    }else if(language == Strings.english){
      Get.updateLocale(const Locale('en', 'US'));
      languageController.selectedLanguage.value = Strings.english;
    }else if(language == Strings.spanish){
      Get.updateLocale(const Locale('es', 'ES'));
      languageController.selectedLanguage.value = Strings.spanish;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: Localization(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: Strings.appName,

      home: HomeScreen(),
    );

  }
}


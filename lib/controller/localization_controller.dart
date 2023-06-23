import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localization/utils/string.dart';

class LanguageController extends GetxController {
  String? selectedValue;
  RxString selectedLanguage = "".obs;
  var localDB = GetStorage();

  var language = <String>[Strings.english, Strings.spanish];

  void onSelected(String value) {
    selectedValue = value;

    update();
    debugPrint(selectedValue);
    changeLanguage(selectedValue!);
  }

  changeLanguage(String selectedLanguage) async {
    switch (selectedLanguage) {
      case Strings.spanish:
        Get.updateLocale(const Locale('es_ES'));
        await localDB.write(Strings.language, selectedLanguage);
        break;

      default:
        await localDB.write(Strings.language, selectedLanguage);
        Get.updateLocale(const Locale('en_US'));
        break;
    }
  }
}

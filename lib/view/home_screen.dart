import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/controller/localization_controller.dart';
import 'package:localization/utils/string.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.language_rounded,
              size: 40,
            ),
            title: const Text(Strings.language),
            subtitle: const Text(Strings.selectlanguage),
            trailing: Obx(() => languageController.selectedLanguage.value.isNotEmpty ? DropdownButton<String>(
                    value: languageController.selectedLanguage.value,
                    onChanged: (newValue) {
                      languageController.onSelected(newValue!);
                      languageController.selectedLanguage.value = newValue;
                    },
                    elevation: 10,
                    items: const [
                      DropdownMenuItem(
                        value: Strings.english,
                        child: Text(
                          Strings.english,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Strings.spanish,
                        child: Text(
                          Strings.spanish,
                        ),
                      ),
                    ]) : const SizedBox()),
          ),
          Text('hello'.tr)
        ],
      ),
    );
  }
}

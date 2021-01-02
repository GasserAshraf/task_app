import 'package:flutter/material.dart';
import 'package:task_app/classes/language.dart';
import 'package:task_app/localization/demo_localization.dart';
import 'package:task_app/main.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _changeLanguage(Language lang) {
    print(lang.languageCode);
    Locale _temp;
    switch (lang.languageCode) {
      case 'en':
        _temp = Locale(lang.languageCode, 'US');
        break;
      case 'ar':
        _temp = Locale(lang.languageCode, 'EG');
        break;
      case 'eg':
        _temp = Locale(lang.languageCode, 'EG');
        break;
      default:
        _temp = Locale(lang.languageCode, 'EG');
    }
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.arrow_right_alt_sharp),
        ],
        title:
            Text(DemoLocalizations.of(context).getTranslatedValue("settings")),
      ),
      body: Center(
        child: Container(
          child: DropdownButton(
            onChanged: (Language lang) {
              _changeLanguage(lang);
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      children: [
                        Text(lang.name),
                      ],
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}

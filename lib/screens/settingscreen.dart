import 'package:flutter/material.dart';
import 'package:task_app/classes/language.dart';
import 'package:task_app/localization/demo_localization.dart';
import 'package:task_app/localization/translation.dart';
import 'package:task_app/main.dart';
import 'package:task_app/screens/leadingWizard/firstScreen.dart';
import 'package:task_app/screens/signUpScreen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _changeLanguage(Language lang) async{
    Locale _temp=await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width*0.4,
          child: DropdownButton(
            hint: Text(getTranslated(context, "changelanguage")),
            onChanged: (Language lang) {
              _changeLanguage(lang);
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
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

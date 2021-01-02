import 'package:flutter/material.dart';
import 'package:task_app/classes/language.dart';
import 'package:task_app/localization/demo_localization.dart';
import 'package:task_app/localization/translation.dart';
import 'package:task_app/main.dart';
import 'package:task_app/screens/leadingWizard/firstScreen.dart';
import 'package:task_app/screens/loginScreen.dart';
import 'package:task_app/screens/signUpScreen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _changeLanguage(Language lang) async {
    Locale _temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Container(
              color: Colors.grey,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              child: Card(
                child: Container(
                  //height: MediaQuery.of(context).size.width*0.2,

                  child: DropdownButton(
                    hint: Text(getTranslated(context, "changelanguage")),
                    onChanged: (Language lang) {
                      _changeLanguage(lang);
                    },
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_downward_outlined,
                      color: Colors.blue,
                    ),
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>((lang) =>
                        DropdownMenuItem(
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
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Container(
              alignment: Alignment.center,
              child: ButtonTheme(
                minWidth: width * 0.8,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(new PageRouteBuilder(
                        opaque: true,
                        transitionDuration: const Duration(seconds:1 ),
                        pageBuilder: (BuildContext context, _, __) {
                          return new LoginScreen();
                        },
                        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                          return new SlideTransition(
                            child: child,
                            position: new Tween<Offset>(
                              begin: const Offset(0, 0),
                              end: Offset.zero,
                            ).animate(animation),
                          );
                        }
                    ));
                    },
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      getTranslated(context, "logout"),
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

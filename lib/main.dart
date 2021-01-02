import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_app/localization/demo_localization.dart';
import 'package:task_app/screens/settingscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context,Locale locale){
    _MyAppState state =context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);

  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;


  void setLocale(Locale locale){
    setState(() {
      _locale=locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingScreen(),
      locale: _locale,
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      localizationsDelegates: [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeListResolutionCallback: ( deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if(locale.languageCode == deviceLocale[0].languageCode&&locale.countryCode==deviceLocale[0].countryCode){
            return deviceLocale[0];
          }
        }
        return supportedLocales.last;
      },
    );
  }
}

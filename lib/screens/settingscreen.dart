import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:task_app/classes/language.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  void _changeLanguage(Language){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Container(
          child:  DropdownButton(
            onChanged: (Language lang){
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

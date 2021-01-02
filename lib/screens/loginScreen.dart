import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/Services/Auth.dart';
import 'package:task_app/Widgets/CustomTextFormField.dart';
import 'package:task_app/localization/translation.dart';
import 'package:task_app/screens/homeScreen.dart';
import 'package:task_app/screens/signUpScreen.dart';
import 'package:task_app/screens/validationScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: height * 0.2,
                  width: width,
                  color: Color(0xFF007AE7),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      getTranslated(context, "login"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.5,
                      child: Image(
                        image: AssetImage("images/Loginicon.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 280.0, right: 20, left: 20),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        icon: Icons.mail,
                        onClick: (value) {
                          _email = value;
                        },
                        hint: getTranslated(context, "email"),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomTextFormField(
                        icon: Icons.lock,
                        onClick: (value) {
                          _password = value;
                        },
                        hint: getTranslated(context, "password"),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.topRight,

                        child: GestureDetector(
                          child: Text(
                            getTranslated(context, "forget password"),
                            style: TextStyle(
                                color: Color(0xFF3A3A3A), fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ButtonTheme(
                          minWidth: width * 0.8,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: ()async {
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                try {
                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                } catch (e) {

                                  print(e.message);
                                }
                              }
                            },
                            child: Opacity(
                              opacity: 0.8,
                              child: Text(
                                getTranslated(context, "login"),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 2.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            new Text(
                              getTranslated(context, "or"),
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Expanded(
                              child: Container(
                                height: 2.0,
                                color: Colors.grey[300],
                              ),
                            ),
                          ]),
                      Container(
                        alignment: Alignment.center,
                        child: ButtonTheme(
                          minWidth: width * 0.8,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () async {
                              // await handleLogin();
                              final user=await  _auth.facebookSigninMethod();
                            },
                            child: Container(
                              width: width * 0.6,
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ImageIcon(
                                      AssetImage("images/facebook.png"),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Text(
                                      getTranslated(context, "loginbyfacebook"),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ButtonTheme(
                          minWidth: width * 0.8,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () async {
                            final user=await _auth.googleSigninMethod();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              width: width * 0.6,
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ImageIcon(
                                      AssetImage("images/google.png"),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Text(
                                      getTranslated(context,"loginbygoogle"),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.1,),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                                    return new HomeScreen();
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
                                getTranslated(context, "skipentry"),
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
                Container(
                  height: height * 0.95,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                   // textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTranslated(context, "donthaveanaccount"),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              new PageRouteBuilder(
                                  opaque: true,
                                  transitionDuration:
                                      const Duration(seconds: 1),
                                  pageBuilder: (BuildContext context, _, __) {
                                    return new SignUpScreen();
                                  },
                                  transitionsBuilder: (_,
                                      Animation<double> animation,
                                      __,
                                      Widget child) {
                                    return new SlideTransition(
                                      child: child,
                                      position: new Tween<Offset>(
                                        begin: const Offset(0, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                    );
                                  }));
                        },
                        child: Text(
                          getTranslated(context, "createnewaccount"),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

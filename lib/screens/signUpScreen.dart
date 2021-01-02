import 'package:flutter/material.dart';
import 'package:task_app/Services/Auth.dart';
import 'package:task_app/Widgets/CustomTextFormField.dart';
import 'package:task_app/screens/loginScreen.dart';
import 'package:task_app/screens/validationScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _name, _familName, _mail, _number, _password;
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
                        "انشاء حساب جديد",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 100),
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.5,
                      child: Image(
                        image: AssetImage("images/Loginicon.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 280.0, right: 20, left: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: ButtonTheme(
                            minWidth: width * 0.8,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: width * 0.6,
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ImageIcon(
                                      AssetImage("images/facebook.png"),
                                      color: Colors.white,
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                        "تسجيل الدخول عبر الفيسبوك",
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
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                icon: Icons.person,
                                onClick: (value) {
                                  _name = value;
                                },
                                hint: "الاسم الاول",
                              ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                icon: Icons.person,
                                onClick: (value) {
                                  _name = value;
                                },
                                hint: "اسم العائلة",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextFormField(
                          icon: Icons.mail,
                          onClick: (value) {
                            _mail = value;
                          },
                          hint: "البريد الالكتروني",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextFormField(
                          icon: Icons.phone_iphone,
                          onClick: (value) {
                            _number = value;
                          },
                          hint: "رقم الهاتف",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextFormField(
                          icon: Icons.lock,
                          onClick: (value) {
                            _password = value;
                          },
                          hint: "كلمة المرور",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "عند الضغط على انشاء حساب توافق على",
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "الشروط و الاحكام",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
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
                              onPressed: () async {
                                if (_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();
                                  try {

                                   // _auth.signUp(_mail, _password);
                                    // String uid = await _auth.signUp(_mail, _password);
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => OtpScreen(
                                                _number, _mail, _password)));
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
                              child: Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          //height: height*0.95,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لديك حساب بالفعل",
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
                                          pageBuilder:
                                              (BuildContext context, _, __) {
                                            return new LoginScreen();
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
                                  "تسجيل الدخول",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

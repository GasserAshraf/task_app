import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/localization/translation.dart';
import 'package:task_app/screens/homeScreen.dart';

class OtpScreen extends StatefulWidget {
  final String phone, mail, password;

  OtpScreen(this.phone, this.mail, this.password);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _pin;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _globalKey,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: height * 0.2,
                width: width,
                color: Color(0xFF007AE7),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    getTranslated(context, "number verification"),
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
                padding: const EdgeInsets.only(top: 280.0, right: 20, left: 20),
                child: Column(
                  children: [
                    Text(
                      getTranslated(context, "verification message"),
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A3A3A)),
                      textDirection: TextDirection.rtl,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Error in this field";
                          }
                        },
                        onSaved: (value) {
                          _pin = value;
                        },
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        decoration: new InputDecoration(
                          hintText: "*    *    *    *",
                          hintStyle: TextStyle(color: Color(0xFF707070)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF007AE7)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF007AE7)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF007AE7)),
                          ),
                        )),
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
                                await FirebaseAuth.instance
                                    .signInWithCredential(
                                        PhoneAuthProvider.credential(
                                            verificationId: _verificationCode,
                                            smsCode: _pin))
                                    .then((value) async {
                                  if (value.user != null) {
                                    final user = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: widget.mail,
                                            password: widget.password);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                        (route) => false);
                                  }
                                });
                              } catch (e) {
                                FocusScope.of(context).unfocus();
                                _scaffoldkey.currentState.showSnackBar(
                                    SnackBar(content: Text('invalid OTP')));
                              }
                            }
                          },
                          child: Opacity(
                            opacity: 0.8,
                            child: Text(
                              getTranslated(context, "Activate"),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone(phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20${phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone(widget.phone);
  }
}

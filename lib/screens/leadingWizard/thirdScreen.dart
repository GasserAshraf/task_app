import 'package:flutter/material.dart';
import 'package:task_app/Constans.dart';
import 'package:task_app/screens/leadingWizard/firstScreen.dart';
import 'package:task_app/screens/leadingWizard/secondScreen.dart';
import 'package:task_app/screens/loginScreen.dart';

class ThirdWizard extends StatefulWidget {
  @override
  _ThirdWizardState createState() => _ThirdWizardState();
}

class _ThirdWizardState extends State<ThirdWizard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: offWhiteColor,
        body: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.2,
              child: Image(
                image: AssetImage("images/P1Mask.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.075,
                  right: width * 0.075,
                  top: height * 0.018),
              child: Container(
                // color: Colors.red,
                width: width * 0.85,
                height: height * 0.6,
                child: Center(
                  child: Image(
                    image: AssetImage("images/P3Body.png"),
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "النص الأساسي يكتب هنا",
                      style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.7,
                      child: Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF007AE7),
                        ),
                        height: height * 0.016,
                        width: width * 0.035,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF007AE7),
                        ),
                        height: height * 0.016,
                        width: width * 0.035,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Opacity(
                      opacity: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF007AE7),
                        ),
                        height: height * 0.016,
                        width: width * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, bottom: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ButtonTheme(
                      minWidth: width * 0.35,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(seconds:1 ),
                              pageBuilder: (BuildContext context, _, __) {
                                return new SecondWizard();
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
                        child: Text(
                          "السابق",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ButtonTheme(
                      minWidth: width * 0.35,
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
                        child: Text(
                          "ابدأ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
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
                  child: Text(
                    "تخطي",
                    style: TextStyle(fontSize: 20, color: Color(0xFF707070)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, top: 32),
              child: Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: Container(
                      color: Color(0xFF707070),
                      width: width * 0.11,
                      height: height * 0.001,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

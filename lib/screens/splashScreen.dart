import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_app/screens/leadingWizard/firstScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();

  Future<void> afterBuild(context) async {
    _scrollController1.animateTo(_scrollController1.position.maxScrollExtent,
        duration: Duration(seconds: 4), curve: Curves.ease);

    _scrollController2.animateTo(_scrollController2.position.maxScrollExtent,
        duration: Duration(seconds: 4), curve: Curves.ease);
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(new PageRouteBuilder(
          opaque: true,
          transitionDuration: const Duration(seconds: 0),
          pageBuilder: (BuildContext context, _, __) {
            return new FirstWizard();
          },
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child){
            return new SlideTransition(
              child: child,
              position: new Tween<Offset>(
                begin: const Offset(0, 0),
                end: Offset.zero,
              ).animate(animation),
            );
          }));
    });
    Timer(Duration(seconds: 2), () {
      afterBuild(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3DBCA7), Color(0xFF007AE7)])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  controller: _scrollController1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Opacity(
                        opacity: 0.3,
                        child: Image(
                          image: AssetImage("images/Layer2.png"),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ),
                Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child:
                            Image(image: AssetImage("images/MainIcon.png")))),
                SingleChildScrollView(
                  controller: _scrollController2,
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Opacity(
                        opacity: 0.3,
                        child: Image(
                          image: AssetImage(
                            "images/Layer2_transport.png",
                          ),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

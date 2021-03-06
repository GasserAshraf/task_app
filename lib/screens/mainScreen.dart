import 'package:flutter/material.dart';
import 'package:task_app/localization/translation.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     // textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            getTranslated(context, "Dose reminder"),
                            style: TextStyle(color: Color(0xFF707070)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [

                              Text(
                                "01:30",
                                style: TextStyle(color: Colors.blue),
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Color(0xFF707070),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.15,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: height * 0.10,
                            width: width * 0.8,
                            margin: EdgeInsets.only(
                                right: 5, left: 5, top: 10, bottom: 15),
                            child: Card(
                              child: Center(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            child: Image(
                                                image: AssetImage(
                                                    'images/image.png'))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                       getTranslated(context, "advertising"),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Card(
                                  child: Container(
                                    height: height * 0.049,
                                    width: width * 0.15,
                                    margin: EdgeInsets.all(20),
                                    child: Image(
                                      image: AssetImage("images/hospital.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(getTranslated(context, "Hospitals"))
                          ],
                        ),


                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Card(
                                  child: Container(
                                    width: width * 0.15,
                                    height: height * 0.049,
                                    margin: EdgeInsets.all(20),
                                    child: Image(
                                      image: AssetImage("images/map-doctor.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(getTranslated(context, "Doctor"))
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Card(
                                  child: Container(
                                    height: height * 0.049,
                                    width: width * 0.15,
                                    margin: EdgeInsets.all(20),
                                    child: Image(
                                      image: AssetImage("images/alarm.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(getTranslated(context, "Drug reminder"))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(

                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     // textDirection: TextDirection.rtl,
                      children: [
                        Text(getTranslated(context, "nearest doctor"),
                            style: TextStyle(color: Colors.blue, fontSize: 20)),
                        Text(
                          getTranslated(context, "view all"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.16,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.8,
                                  margin: EdgeInsets.only(
                                      right: 5, left: 5, top: 10, bottom: 15),
                                  child: Card(
                                    child: Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Color(0xFFFBFBFB),
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("images/image.png")),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Text(getTranslated(context, "city/Government")),
                                                Text(getTranslated(context, "Doctor")),
                                                Text(getTranslated(context, "Majors"))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom:20,
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                          color: Color(0XFFEBEBEB),
                                      ),

                                      child: Text(getTranslated(context, "distance")),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     // textDirection: TextDirection.rtl,
                      children: [
                        Text(getTranslated(context, "nearest hospital"),
                            style: TextStyle(color: Colors.blue, fontSize: 20)),
                        Text(
                          "view all",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.18,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(

                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.8,
                                  margin: EdgeInsets.only(
                                      right: 5, left: 5, top: 10, bottom: 15),
                                  child: Card(
                                    child: Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              color: Color(0xFFFBFBFB),
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("images/image.png")),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Text(getTranslated(context, "city/Government")),
                                                Text(getTranslated(context, "Hospitals")),
                                                Text(getTranslated(context, "Majors"))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom:20,
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0XFFEBEBEB),
                                      ),

                                      child: Text(getTranslated(context, "distance")),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

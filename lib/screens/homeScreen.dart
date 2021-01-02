import 'package:flutter/material.dart';
import 'package:task_app/screens/mainScreen.dart';
import 'package:task_app/screens/settingscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  MainScreen mainScreen;
  SettingScreen settingScreen;
  List<Widget> _screenss;
  Widget currentScreen;

  @override
  void initState() {
    // TODO: implement initState
    mainScreen = MainScreen();
    settingScreen =SettingScreen();
    _screenss = [mainScreen, settingScreen, mainScreen, mainScreen];
    currentScreen = mainScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF007AE7),
        actions: [
          Center(
              child: Text(
            "شافي",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 15.0),
            child: ImageIcon(
              AssetImage('images/appbar.png'),
              color: Colors.white,
            ),
          ),
        ],
        leading: Row(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
            print(_currentTabIndex);
            print("change");
          });
        },
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("الرئيسية")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("البحث")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("الحساب")),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text("المزيد")),
        ],
      ),
      body: currentScreen,
    );
  }
}

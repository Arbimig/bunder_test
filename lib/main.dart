import 'package:bunder_test/database/database.dart';
import 'package:bunder_test/widgets/badges.dart';
import 'package:bunder_test/widgets/gradient_button.dart';
import 'package:bunder_test/widgets/user_info.dart';
import 'package:flutter/material.dart';

import 'database/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Color.fromRGBO(10, 235, 154, 1),
        // accentColor: Color.fromRGBO(254, 71, 74, 1),
        // primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Color.fromRGBO(40, 40, 46, 1),
                fontWeight: FontWeight.w800,
                fontSize: 22),
            headline2: TextStyle(
                color: Color.fromRGBO(40, 40, 46, 1),
                fontWeight: FontWeight.w600,
                fontSize: 14),
            headline3: TextStyle(
                color: Color.fromRGBO(40, 40, 46, 1),
                fontWeight: FontWeight.w800,
                fontSize: 14),
            headline4: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
            subtitle1: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Color.fromRGBO(210, 57, 223, 1),
            )),
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    styleConst = Theme.of(context).textTheme;
    sizeConst = MediaQuery.of(context).size;
    themeConst = Theme.of(context);
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      body: Center(
        child: Text("Home view"),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final Color bottomSheetColor = Color.fromRGBO(243, 243, 243, 0.9);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> users = userMap1;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            context: context,
            builder: (context) => Container(
                  height: users["work"] == null || users["company"] == null
                      ? sizeConst.height * 0.25
                      : sizeConst.height * 0.40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: bottomSheetColor),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: sizeConst.height * 0.02,
                        ),
                        Container(
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(173, 187, 209, 1),
                          ),
                        ),
                        SizedBox(
                          height: sizeConst.height * 0.02,
                        ),
                        Badges(users),
                        SizedBox(
                          height: sizeConst.height * 0.04,
                        ),
                        UserInfo(users),
                        SizedBox(
                            height: users["work"] == null ||
                                    users["company"] == null
                                ? sizeConst.height * 0.02
                                : sizeConst.height * 0.04),
                        GradientButton(users)
                      ]),
                ));
      },
    );
  }
}

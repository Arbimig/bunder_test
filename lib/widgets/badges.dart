import 'package:bunder_test/database/constants.dart';
import 'package:bunder_test/widgets/CustomIcon.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final Color availableColor = Color.fromRGBO(10, 235, 154, 1);
  final Color noAccessColor = Color.fromRGBO(254, 71, 74, 1);
  final Color approvedColor = Color.fromRGBO(10, 235, 154, 1);
  final List<Color> mergedMyTop5 = [
    Color.fromRGBO(210, 57, 223, 1),
    Color.fromRGBO(30, 199, 236, 1),
  ];

  final List<Color> myTop30 = [
    Color.fromRGBO(118, 57, 248, 1),
    Color.fromRGBO(118, 57, 248, 1),
  ];

  final List<Color> top5 = [
    Color.fromRGBO(39, 232, 174, 1),
    Color.fromRGBO(35, 194, 235, 1),
  ];
  final List<Color> top30 = [
    Color.fromRGBO(57, 110, 248, 1),
    Color.fromRGBO(57, 110, 248, 1),
  ];
  final Map<String, dynamic> _user;
  Badges(this._user);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        available(_user),
        SizedBox(
          width: _user["work"] != null ? 15 : 0,
        ),
        access(_user),
        SizedBox(
          width: _user["work"] != null ? 15 : 0,
        ),
        tops(_user),
      ],
    );
  }

  Widget badgeStyle(
      {String text, Map<String, dynamic> user, bool icon, List<Color> colors}) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: themeConst.textTheme.headline4,
            ),
            icon
                ? CustomIcon(
                    dx: 6,
                    dy: 6,
                    colors: [Colors.white, Colors.white],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget available(Map<String, dynamic> user) {
    if (_user["work"] != null ||
        _user["company"] != null ||
        _user["phone"] != null ||
        _user["email"] != null) {
      return Badge("AVAILABLE", availableColor);
    } else {
      return SizedBox();
    }
  }

  Widget access(Map<String, dynamic> user) {
    if (_user["work"] == null ||
        _user["company"] == null ||
        _user["phone"] == null ||
        _user["email"] == null) {
      return Badge("NO ACCESS", noAccessColor);
    } else {
      return Badge(
        "APPROVED",
        approvedColor,
      );
    }
  }

  Widget tops(Map<String, dynamic> user) {
    if (user["name"] != null &&
        user["work"] != null &&
        user["company"] != null &&
        user["phone"] != null &&
        user["email"] != null) {
      if (user["merged"] == true) {
        return badgeStyle(
            text: "MERGED", user: user, icon: true, colors: mergedMyTop5);
      } else if (user["my_top"] <= 5) {
        return badgeStyle(
            text: "MY TOP 5", user: user, icon: true, colors: mergedMyTop5);
      } else if (user["my_top"] <= 30) {
        return badgeStyle(
            text: "MY TOP 30", user: user, icon: true, colors: myTop30);
      } else if (user["top"] <= 5) {
        return badgeStyle(text: 'TOP 5', user: user, icon: false, colors: top5);
      } else if (user["top"] <= 30) {
        return badgeStyle(
            text: 'TOP 30', user: user, icon: false, colors: top30);
      }
    }
    return SizedBox();
  }
}

class Badge extends StatelessWidget {
  final String _text;
  final Color _color;
  Badge(this._text, this._color);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: _color, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
        child: Text(
          _text,
          style: themeConst.textTheme.headline4,
        ),
      ),
    );
  }
}

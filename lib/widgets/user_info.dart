import 'package:bunder_test/database/constants.dart';
import 'package:bunder_test/widgets/CustomIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInfo extends StatelessWidget {
  final confirmIconColor = Color.fromRGBO(210, 57, 223, 1);
  final Map _user;
  UserInfo(this._user);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _user['name'],
              style: styleConst.headline1,
            ),
            SizedBox(
              width: _user["verificate"] == true ? 10 : 0,
            ),
            _user["verificate"] == true
                ? SvgPicture.asset(
                    "assets/confirm.svg",
                    width: 12,
                    height: 12,
                    color: confirmIconColor,
                  )
                : SizedBox()
          ],
        ),
        _user["work"] != null
            ? Text(
                _user["work"],
                style: styleConst.headline2,
              )
            : SizedBox(),
        _user["company"] != null
            ? Text(_user["company"], style: styleConst.headline2)
            : SizedBox(),
        SizedBox(
          height: _user["phone"] == null ? 10 : 20,
        ),
        _user["company"] != null && _user["work"] != null
            ? _user["phone"] == null
                ? FieldInfo(
                    "Mobile phone", _user["token_count"].toString(), () {})
                : available(_user["phone"])
            : SizedBox(),
        SizedBox(
          height: 5,
        ),
        _user["company"] != null && _user["work"] != null
            ? _user["email"] == null
                ? FieldInfo("Email", _user["token_count"].toString(), () {})
                : available(_user["email"])
            : SizedBox(),
      ],
    );
  }

  Widget available(info) {
    return Container(
      width: 230,
      child: Center(
        child: Text(
          info,
          style: styleConst.headline2,
        ),
      ),
    );
  }
}

class FieldInfo extends StatelessWidget {
  final String _text;
  final String _tokenCount;
  final Function _function;
  FieldInfo(this._text, this._tokenCount, this._function);
  final Color color = Color.fromRGBO(205, 214, 235, 1);
  final List<Color> customIconGradient = [
    Color.fromRGBO(210, 57, 223, 1),
    Color.fromRGBO(30, 199, 236, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 40,
      color: Color.fromRGBO(234, 236, 241, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _function,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child:
                  // Icon(MyFlutterApp.union),
                  SvgPicture.asset(
                "assets/union.svg",
                width: 12,
                height: 18,
                color: color,
              ),
            ),
          ),
          Text(
            _text,
            style: themeConst.textTheme.headline2,
          ),
          Container(
            height: 40,
            width: 40,
            child: Center(
              child: Stack(children: [
                Positioned(
                  left: 22,
                  bottom: 20,
                  child:
                      Text(_tokenCount, style: themeConst.textTheme.subtitle1),
                ),
                Center(
                  child: Positioned(
                    child: CustomPaint(
                      foregroundPainter: CustomCircleIcon(
                        colors: customIconGradient,
                      ),
                      size: Size(22, 22),
                    ),
                  ),
                ),
                Center(
                  child: CustomPaint(
                    painter: CustomIconDiamond(
                      colors: customIconGradient,
                    ),
                    size: Size(10, 10),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

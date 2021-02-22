import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Map<String, dynamic> user;
  GradientButton(this.user);
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(210, 57, 223, 1),
      Color.fromRGBO(30, 199, 236, 1),
      Color.fromRGBO(210, 57, 223, 1),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final innerDecoration = BoxDecoration(
    color: Color.fromRGBO(243, 243, 243, 1),
    borderRadius: BorderRadius.circular(6),
  );

  final gradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(4.0, 0.0),
      colors: <Color>[
        Color.fromRGBO(210, 57, 223, 1),
        Color.fromRGBO(30, 199, 236, 1),
        Color.fromRGBO(210, 57, 223, 1),
      ],
    ),
    borderRadius: BorderRadius.circular(7),
  );
  @override
  Widget build(BuildContext context) {
    if (user["name"] != null &&
        user["work"] != null &&
        user["company"] != null &&
        user["phone"] != null &&
        user["email"] != null) {
      return gradientButton(
        text: "Show more",
        func: () {},
        width: 128,
      );
    } else if (user["work"] == null || user["company"] == null) {
      return gradientButton(
        text: "INVITE",
        func: () {},
        width: 128,
      );
    } else {
      return gradientButton(
        text: "REQUEST ACCESS",
        func: () {},
        width: 150,
      );
    }
  }

  String buttonText() {
    if (user["name"] != null &&
        user["work"] != null &&
        user["company"] != null &&
        user["phone"] != null &&
        user["email"] != null) {
      return "Show more";
    } else if (user["work"] == null || user["company"] == null) {
      return "INVITE";
    } else {
      return "REQUEST ACCESS";
    }
  }

  Widget gradientButton({String text, Function func, double width}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            decoration: innerDecoration,
          ),
        ),
        height: 30,
        decoration: gradientBoxDecoration,
        width: user["name"] == null ||
                user["work"] == null ||
                user["company"] == null ||
                user["phone"] == null ||
                user["email"] == null
            ? 150
            : 128,
      ),
    );
  }
}

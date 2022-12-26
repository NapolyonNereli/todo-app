import 'package:flutter/material.dart';

import 'const_colors.dart';

class TodoAddButtonStyle {
  static var buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ConstColors.purpleParadise),
    textStyle: MaterialStateProperty.all(const TextStyle(
      fontSize: 20,
    )),
    elevation: MaterialStateProperty.all(0),
  );
}

class TextFieldDecoration {
  static var customInput = InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: ConstColors.purpleParadise,
          )),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      labelText: "Enter Todo Item",
      labelStyle: const TextStyle(
        color: ConstColors.purpleParadise,
      ));
}

class CustomText {
  static var buttonText = const TextStyle(color: ConstColors.morrowWhite);
  static var sliderText =
      const TextStyle(color: ConstColors.morrowWhite, fontSize: 20);
  static var pageTitle =
      const TextStyle(fontSize: 50, color: ConstColors.purpleParadise,);
}

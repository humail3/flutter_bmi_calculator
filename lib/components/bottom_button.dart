import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.titleText, this.onPress});

  final String? titleText;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kPinkColour,
        margin: EdgeInsets.only(top: 10.0),
        height: 70.0,
        width: double.infinity,
        child: Center(
          child: Text(
            titleText!,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

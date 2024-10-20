import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    this.icn,
    this.onPress,
  });

  final void Function()? onPress;
  final IconData? icn;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icn),
      elevation: 10.0,
      fillColor: Colors.grey,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      hoverElevation: 10.0,
    );
  }
}

import 'package:flutter/material.dart';

// Refractor widget reusable card
class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, this.colour, this.cardChild, this.onPress});

  final Widget? cardChild;
  final Color? colour;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Refractor widget Child of reusable card
class ReusableCardChild extends StatelessWidget {
  const ReusableCardChild({super.key, required this.icnData,required this.label});

  final IconData? icnData;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icnData,
        size: 80.0,
      ),
      const SizedBox(height: 10.0),
      Text(label!, style: const TextStyle(fontSize: 20.0, color: Colors.grey)),
    ]);
  }
}
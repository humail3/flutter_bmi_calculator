import 'package:flutter/material.dart';
import 'package:bmi_calculation/screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF090E21),
          elevation: 10.0,
        ),
        scaffoldBackgroundColor: const Color(0xff090E20),
      ),
      home: const InputPage(),
    );
  }
}

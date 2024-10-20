import 'package:bmi_calculation/components/bottom_button.dart';
import 'package:bmi_calculation/constants.dart';
import 'package:bmi_calculation/screens/input_page.dart';
import 'package:bmi_calculation/components/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
   const Result({super.key, this.textResult, this.bmiResult, this.interpretationResult});

  final String? textResult;
  final String? bmiResult;
  final String? interpretationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomCenter,
                  child: Text('Your Results', style: kResultTitleTextStyle)),
            ),
            Expanded(
                flex: 8,
                child: ReusableCard(
                  colour: inactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textResult!,
                        style: kResultNormalTextStyle,
                      ),
                      Text(
                        bmiResult!,
                        style: kResultBMITextStyle,
                      ),
                      Text(
                        interpretationResult!,
                        style: kResultDescriptionTextStyle,
                      )
                    ],
                  ),
                )),
            BottomButton(
                titleText: 'RE-CALCULATE',
                onPress: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

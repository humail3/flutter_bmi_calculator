import 'package:bmi_calculation/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculation/components/reusable_card.dart';
import 'package:bmi_calculation/constants.dart';
import 'package:bmi_calculation/components/reusable_card_child.dart';
import 'package:bmi_calculation/components/round_icon_button.dart';
import 'results_page.dart';
import 'package:bmi_calculation/components/bottom_button.dart';

const bottomContainerHeight = 80.0;
const inactiveCardColor = Color(0xff1d1e33);
const activeCardColor = Color(0xff404070);
const bottomContainerColour = Color(0xFFFF5B1F);

enum gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(children: [
        Expanded(
            child: Row(children: [
          Expanded(
              child: ReusableCard(
            onPress: () {
              setState(() {
                selectedGender = gender.MALE;
              });
            },
            colour: selectedGender == gender.MALE
                ? activeCardColor
                : inactiveCardColor,
            cardChild: ReusableCardChild(
              icnData: Icons.male,
              label: 'MALE',
            ),
          )),
          Expanded(
              child: ReusableCard(
            onPress: () {
              setState(() {
                selectedGender = gender.FEMALE;
              });
            },
            colour: selectedGender == gender.FEMALE
                ? activeCardColor
                : inactiveCardColor,
            cardChild: ReusableCardChild(
              icnData: Icons.female,
              label: 'FEMALE',
            ),
          )),
        ])),
        Expanded(
            child: ReusableCard(
          colour: inactiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kCardHeadingTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: kCountingTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kCardHeadingTextStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8d8e98),
                    thumbColor: kPinkColour,
                    overlayColor: Color(0x29eb1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
                child: Slider(
                    value: height.toDouble(),
                    min: 180.0,
                    max: 360.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    }),
              )
            ],
          ),
        )),
        Expanded(
            child: Row(children: [
          Expanded(
              child: ReusableCard(
            colour: inactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WEIGHT',
                  style: kCardHeadingTextStyle,
                ),
                Text(
                  weight.toString(),
                  style: kCountingTextStyle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RoundIconButton(
                    icn: FontAwesomeIcons.minus,
                    onPress: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RoundIconButton(
                    icn: FontAwesomeIcons.plus,
                    onPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ]),
              ],
            ),
          )),
          Expanded(
              child: ReusableCard(
            colour: inactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AGE',
                  style: kCardHeadingTextStyle,
                ),
                Text(
                  age.toString(),
                  style: kCountingTextStyle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RoundIconButton(
                    icn: FontAwesomeIcons.minus,
                    onPress: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RoundIconButton(
                    icn: FontAwesomeIcons.plus,
                    onPress: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ]),
              ],
            ),
          )),
        ])),
        BottomButton(
          titleText: 'Calculate',
          onPress: () {

            CalculatorBrain cal=CalculatorBrain(height,weight);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Result(
              bmiResult: cal.calculateBMI(),
              textResult: cal.getResult(),
                interpretationResult:cal.getInterpretation(),
            )));
          },
        ),
      ]),
    );
  }
}

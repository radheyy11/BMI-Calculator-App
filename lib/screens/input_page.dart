import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColour;
  Color femaleCardColor = kinactiveCardColour;

  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: kactiveCardColour,
      ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male ? kinactiveCardColour : kactiveCardColour,
                        cardChild:IconContent(ic: FontAwesomeIcons.mars, txt: 'MALE'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female ? kinactiveCardColour : kactiveCardColour,
                        cardChild: IconContent(ic: FontAwesomeIcons.venus, txt: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: klabelTxtStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kheavyLabelTextStyle,
                          ),
                          Text(
                            'cm',
                            style: klabelTxtStyle,
                          ),
                        ]
                      ),
                      //theme and cosmetic part done in sliderTheme widget
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        //actual properties done in slider widget
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: klabelTxtStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: kheavyLabelTextStyle,
                                  ),
                                  Text(
                                    'kg',
                                    style: klabelTxtStyle,
                                  ),
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                      ic: FontAwesomeIcons.minus,
                                      onPressed: (){
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                  ),
                                  SizedBox(width: 15.0),
                                  RoundIconButton(
                                      ic: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ]
                            )
                          ]
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: klabelTxtStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    age.toString(),
                                    style: kheavyLabelTextStyle,
                                  ),
                                  Text(
                                    'yr',
                                    style: klabelTxtStyle,
                                  ),
                                ]
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    ic: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                ),
                                SizedBox(width: 15.0),
                                RoundIconButton(
                                    ic: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                ),
                              ]
                            )
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){

                  CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      resultInterpretation: calc.getInterpretation(),
                    )),
                  );
                },
                child: Container(
                  child: Center(child: Text("CALCULATE", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w800))),
                  color: kbottomContainerColour,
                  margin: EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  height: 75.0,
                ),
              )
            ],
          ),
        )
    );
  }
}




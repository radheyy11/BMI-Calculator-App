import 'package:bmicalculator/screens/input_page.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText, required this.resultInterpretation});

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900)),
            )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: () {},
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(
                      resultInterpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ]
              ),
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: (){
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            child: Container(
              child: Center(child: Text("RE - CALCULATE", style: TextStyle(fontSize: 30.0))),
              color: kbottomContainerColour,
              margin: EdgeInsets.only(top: 5.0),
              height: 75.0,
            ),
          )


        ]
      ),
    );
  }
}

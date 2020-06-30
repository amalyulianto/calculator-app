import 'package:flutter/material.dart';
import 'const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "÷" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = '0';
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget myButton({buttonText, colour}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: RawMaterialButton(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: 'Comfortaa',
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          elevation: 0.0,
          fillColor: colour,
          shape: CircleBorder(),
          padding: EdgeInsets.all(24.0),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkBackground,
        body: Container(
          // padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                alignment: Alignment.bottomRight,
                child: Text(
                  output,
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: kBlueText,
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Expanded(
              //   child: Divider(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myButton(buttonText: 'C', colour: kDarkButton1),
                  myButton(buttonText: '±', colour: kDarkButton1),
                  myButton(buttonText: '%', colour: kDarkButton1),
                  myButton(buttonText: '÷', colour: kDarkButton1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myButton(buttonText: '7'),
                  myButton(buttonText: '8'),
                  myButton(buttonText: '9'),
                  myButton(buttonText: 'x', colour: kDarkButton1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myButton(buttonText: '4'),
                  myButton(buttonText: '5'),
                  myButton(buttonText: '6'),
                  myButton(buttonText: '+', colour: kDarkButton1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myButton(buttonText: '1'),
                  myButton(buttonText: '2'),
                  myButton(buttonText: '3'),
                  myButton(buttonText: '-', colour: kDarkButton1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myButton(buttonText: '.'),
                  myButton(buttonText: '0'),
                  myButton(buttonText: '00'),
                  myButton(buttonText: '=', colour: kBlueText),
                ],
              ),
            ],
          ),
        ));
  }
}

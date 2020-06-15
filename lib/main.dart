import 'package:flutter/material.dart';
// import 'package:calculatorApp/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';

  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Invalid input');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }

      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '0';
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget myButton(buttonText) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey,
        child: OutlineButton(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(24.0),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Normal Calculator'),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          child: Column(
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
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Row(
                children: <Widget>[
                  myButton('1'),
                  myButton('2'),
                  myButton('3'),
                  myButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  myButton('4'),
                  myButton('5'),
                  myButton('6'),
                  myButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  myButton('7'),
                  myButton('8'),
                  myButton('9'),
                  myButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  myButton('.'),
                  myButton('0'),
                  myButton('.00'),
                  myButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  myButton('CLEAR'),
                  myButton('='),
                ],
              ),
            ],
          ),
        ));
  }
}

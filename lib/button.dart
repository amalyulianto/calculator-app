// import 'package:flutter/material.dart';
// // import 'main.dart';

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

// class Button extends StatefulWidget {
//   @override
//   _ButtonState createState() => _ButtonState();
// }

// class _ButtonState extends State<Button> {
//   String buttonText;

//   String output;
//   String _output = '0';
//   double num1 = 0;
//   double num2 = 0;
//   String operand = '';

//   buttonPressed(String buttonText) {
//     if (buttonText == 'CLEAR') {
//       _output = '0';
//       num1 = 0;
//       num2 = 0;
//       operand = '';
//     } else if (buttonText == '+' ||
//         buttonText == '-' ||
//         buttonText == 'x' ||
//         buttonText == '/') {
//       num1 = double.parse(output);

//       operand = buttonText;

//       _output = '0';
//     } else if (buttonText == '.') {
//       if (_output.contains('.')) {
//         print('Invalid input');
//         return;
//       } else {
//         _output = _output + buttonText;
//       }
//     } else if (buttonText == '=') {
//       num2 = double.parse(output);
//       if (operand == '+') {
//         _output = (num1 + num2).toString();
//       }
//       if (operand == '-') {
//         _output = (num1 - num2).toString();
//       }

//       if (operand == 'x') {
//         _output = (num1 * num2).toString();
//       }
//       if (operand == '/') {
//         _output = (num1 / num2).toString();
//       } else {
//         _output = _output + buttonText;
//       }

//       print(_output);
//     }

//     setState(() {
//       output = double.parse(_output).toStringAsFixed(2);
//     });

   
//   }
//    Button(String buttonText){
//      this.buttonText = buttonText;
//      return buttonText;
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: Colors.blueGrey,
//         child: OutlineButton(
//           child: Text(
//             buttonText,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           padding: EdgeInsets.all(24.0),
//           onPressed: () => buttonPressed(buttonText),
//         ),
//       ),
//     );
//   }
// }

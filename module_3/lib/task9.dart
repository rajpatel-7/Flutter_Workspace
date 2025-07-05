import 'package:flutter/material.dart';

void main() {
  runApp(MyApp9());
}

class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _output = "0";
  String _input = "";
  double _result = 0;
  String _operation = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _input = "";
        _result = 0;
        _operation = "";
        _output = "0";
      } else if (value == "=") {
        if (_operation.isNotEmpty) {
          double num1 = double.parse(_input.split(_operation)[0]);
          double num2 = double.parse(_input.split(_operation)[1]);

          if (_operation == "+") _result = num1 + num2;
          if (_operation == "-") _result = num1 - num2;
          if (_operation == "*") _result = num1 * num2;
          if (_operation == "/") _result = num1 / num2;

          _output = _result.toString();
          _input = _output;
          _operation = "";
        }
      } else if ("+-*/".contains(value)) {
        if (_operation.isEmpty) {
          _operation = value;
          _input += value;
        }
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(label),
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("="),
                  _buildButton("+"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

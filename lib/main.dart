import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String display = "0";

  void pressButton(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void clearDisplay() {
    setState(() {
      display = "0";
    });
  }

  Widget calcButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            if (text == "C") {
              clearDisplay();
            } else {
              pressButton(text);
            }
          },
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Calculator"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      calcButton("7"),
                      calcButton("8"),
                      calcButton("9"),
                      calcButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("4"),
                      calcButton("5"),
                      calcButton("6"),
                      calcButton("*"),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("1"),
                      calcButton("2"),
                      calcButton("3"),
                      calcButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("0"),
                      calcButton("C"),
                      calcButton("="),
                      calcButton("+"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

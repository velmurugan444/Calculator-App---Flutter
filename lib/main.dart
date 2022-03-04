// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  @override
  Widget build(BuildContext context) {
    operations(String value) {
      if (value == "CLEAR") {
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else if (value == "+" || value == "-" || value == "/" || value == "X") {
        print(output);
        num1 = double.parse(output);
        operand = value;
        _output = "0";
      } else if (value == ".") {
        if (_output.contains(".")) {
          print("Already contains a decimal");
          return;
        } else {
          _output = _output + value;
        }
      } else if (value == "=") {
        num2 = double.parse(output);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "X") {
          _output = (num1 * num2).toString();
        }
        if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        _output = _output + value;
      }

      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    Widget button(String buttontext) {
      return Expanded(
        // ignore: deprecated_member_use
        child: OutlineButton(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            buttontext,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            operations(buttontext);
          },
        ),
      );
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Calculator App"),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: const TextStyle(
                      fontSize: 36.0, fontWeight: FontWeight.bold),
                )),
            const Expanded(child: Divider()),
            Column(
              children: [
                Row(children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("/")
                ]),
                Row(children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("X")
                ]),
                Row(children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-")
                ]),
                Row(children: [
                  button("."),
                  button("0"),
                  button("00"),
                  button("+")
                ]),
                Row(children: [button("CLEAR"), button("=")]),
              ],
            )
          ]),
        ));
  }
}

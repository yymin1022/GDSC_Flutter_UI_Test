import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GDSC CAU Flutter UI Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello, GDSC CAU Flutter UI Test!",
            ),
            ElevatedButton(child: Text("Click Me!"), onPressed: () {
              FlutterDialog();
            }),
            Switch(value: _isSwitchOn, onChanged: (value) {
              setState(() {
                _isSwitchOn = value;
              });
            }),
            Checkbox(value: _isChecked, onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            }),
          ],
        ),
      ),
    );
  }

  void FlutterDialog() {
    showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Dialog Title"),
          content: Text(
            "Dialog Content",
          ),
          actions: <Widget>[
            new TextButton(
              child: Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MaterialHomePage(),
      );
    }

    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: CupertinoHomePage(),
    );
  }
}

class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key});

  @override
  _MaterialHomePageState createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
  bool _isChecked = false;
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GDSC CAU Flutter UI Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Hello, GDSC CAU Flutter UI Test!"),
            ElevatedButton(
              child: const Text("Click Me!"),
              onPressed: () {
                FlutterDialog();
              }
            ),
            Switch(
                value: _isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    _isSwitchOn = value;
                  });
              }
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }
            ),
          ],
        ),
      ),
    );
  }

  void FlutterDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Dialog Title"),
          content: const Text("Dialog Content",),
          actions: <Widget>[
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("GDSC CAU Flutter UI Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Hello, GDSC CAU Flutter UI Test!"),
            CupertinoButton(
              child: const Text("Click Me!"),
              onPressed: () {
                FlutterDialog();
              }
            ),
            CupertinoSwitch(
              value: _isSwitchOn,
              onChanged: (value) {
                setState(() {
                  _isSwitchOn = value;
                });
              }
            ),
          ],
        ),
      ),
    );
  }

  void FlutterDialog() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Dialog Title"),
          content: const Text("Dialog Content"),
          actions: <Widget>[
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }
}
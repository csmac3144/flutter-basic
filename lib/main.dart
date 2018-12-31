// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: BasicApp(),
      theme: ThemeData.dark(),
    ));

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Material(child: BasicStatefulWidget()),
      );
}

class BasicStatefulWidget extends StatefulWidget {
  final Random rng = new Random();
  @override
  State<StatefulWidget> createState() => _BasicState();
}

class _BasicState extends State<BasicStatefulWidget> {
  String _label = "Initial value";
  void _changeValue() {
    setState(() {
      int newValue = widget.rng.nextInt(100);
      _label = 'New value: $newValue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Katie loves Christmas cake!",
          ),
          Text(
            _label,
          ),
          PlatformButton(
              child: Text(
                "Push Me",
              ),
              onPressed: _changeValue),
          PlatformButton(
              child: Text(
                "First Page",
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BasicFirstPage()));
              })
        ]);
  }
}

class BasicSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          PlatformButton(
            child: Text("Goto Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]));
  }
}

class BasicFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          PlatformButton(
            child: Text("Goto Page 2"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasicSecondPage()));
            },
          ),
          PlatformButton(
            child: Text("Goto Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]));
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'dart:math';

void main() => runApp(BasicApp());

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: BasicStatefulWidget(),
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
              onPressed: _changeValue)
        ]);
  }
}


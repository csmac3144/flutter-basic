import 'package:flutter/widgets.dart';

void main() => runApp(BasicApp());

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          "Katie loves Christmas!",
          textDirection: TextDirection.ltr,
        ),
      );
}

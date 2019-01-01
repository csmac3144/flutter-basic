import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BasicForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicFormState();
  }
}

class BasicFormState extends State<BasicForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PlatformButton(
                      child: Text("Cancel"),
                      color: Theme.of(context).disabledColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    PlatformButton(
                      child: Text("Save"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Saving...")));
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                )
              ],
            )));
  }
}

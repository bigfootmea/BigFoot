import 'package:flutter/material.dart';

class Idea extends StatefulWidget {
  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: ListView(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter your Idea\'s',
            ),
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
            },
            child: Text('Submit'),
          ),
        ],
      ),
    ));
  }
}

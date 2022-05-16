import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Developer'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [

            ],
          ),
        )
      ),
    );
  }
}

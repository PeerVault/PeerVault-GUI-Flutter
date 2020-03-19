import 'package:flutter/material.dart';

class CreateOwner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              child: Image(
                image: AssetImage('assets/peervault-logo.png'),
                fit: BoxFit.scaleDown,
                height: 120,
              )
            ),
            SizedBox(height: 30),
          ]
        )
      )
    );
  }
}
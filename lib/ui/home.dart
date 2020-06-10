import 'package:flutter/material.dart';
import 'package:peervault/model/owner.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Owner owner = ModalRoute.of(context).settings.arguments;

    if (owner != null) {
      print(owner.toJson());
    }

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
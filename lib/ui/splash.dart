import 'dart:io';
import 'package:flutter/material.dart';
import 'package:peervault/service/api/owner.dart';
import 'package:peervault/ui/utils/color_loader_2.dart';
import 'package:peervault/service/daemon.dart';

class Splash extends StatefulWidget {
  Splash() : super();

  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  Daemon daemon = Daemon();

  @override
  void initState() {
    // TODO Need to improve the daemon state monitoring
    super.initState();
    this.daemon.status().then((status) {
      this.daemon.restart().then((state) {
        sleep(new Duration(seconds:2));
        fetchOwner().then((owner) {
          if (owner == null) {
            Navigator.pushNamed(context, '/createOwner');
          } else {
            Navigator.pushNamed(context, '/home', arguments: owner);
          }
        });
      });
    });
  }

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
            ColorLoader2(),
          ]
        )
      )
    );
  }
}
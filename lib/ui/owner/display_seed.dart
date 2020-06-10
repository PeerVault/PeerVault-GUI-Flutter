import 'package:flutter/material.dart';

class DisplaySeed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String seed = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      body: Column(children: [
        Row(children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              // decoration: new BoxDecoration(color: Colors.red),
              height: 170,
              width: 170,
              padding: const EdgeInsets.fromLTRB(40, 30, 15, 40),
              child: Image(
                  image: AssetImage('assets/peervault-logo.png')
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 50, 0),
              width: MediaQuery.of(context).size.width - 170,
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[Text(
                      'Recovery Seed',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.2,
                        fontSize: 36,
                        fontFamily: "Roboto",
                      )
                  )],
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[Expanded(
                    child: Text(
                      'Your Vault has been created with sucesss!\n'
                          'Please ensure to keep this phrase in security in order '
                          'to restore your Ownership in case of disaster.\n'
                          'Keep your paper key somewhere safe, on a cold storage.',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.3,
                        fontSize: 14,
                        fontFamily: "Roboto",
                      ),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  )],
                ),
              ])
          ),
        ]),
        SizedBox(height: 50),
        Container(
          child: Column(children: <Widget>[
            Text(
              seed,
              style: TextStyle(
                color: Colors.green,
                height: 1.3,
                fontSize: 16,
                fontFamily: "Roboto",
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
            SizedBox(height: 30),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('OK, it\'s somewhere safe!'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }
            )
          ]),
        )
      ])
    );
  }
}
import 'package:flutter/material.dart';

enum UnlockCodeOptions {
  PasswordPolicyNone,
  PasswordPolicyAlwaysRequired,
  PasswordPolicyOnlyWhenExposure
}

class CreateOwner extends StatefulWidget {
  CreateOwner() : super();

  _CreateOwner createState() => _CreateOwner();
}

class _CreateOwner extends State<CreateOwner> {
  UnlockCodeOptions _unlockCodeOption = UnlockCodeOptions.PasswordPolicyOnlyWhenExposure;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Row(children: <Widget>[
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
                      'Owner\nCreation',
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
                      'Welcome in the PeerVault community!\n\nYou will now create a new Owner for a Vault, The Owner creation process creates a Master Key. It will be stored on a dedicated OSX Keychain on your computer, which is the most secure place to ensure other software are not able to access that precise key used to encrypt all of your secrets.\n\nThe master key also has a Paper format, it is a phrase composed of 24 words. As long as you keep those words, you will be able to decrypt any Vault backup in case of data disaster.',
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
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(children: <Widget>[
                        inputLine(context, "Owner name", false),
                        inputLine(context, "Device name", false),
                        inputLine(context, "Unlock Code", true),
                      ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Unlock Condition',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "Roboto"
                            )
                          ),
                          RadioListTile(
                            dense: false,
                            title: const Text(
                              'Always required',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto"
                              )
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            value: UnlockCodeOptions.PasswordPolicyAlwaysRequired,
                            groupValue: _unlockCodeOption,
                            onChanged: (UnlockCodeOptions value) {
                              setState(() { _unlockCodeOption = value; });
                            },
                          ),
                          RadioListTile(
                            dense: false,
                            title: const Text(
                              'When secret are reveal',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "Roboto",
                              )
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            value: UnlockCodeOptions.PasswordPolicyOnlyWhenExposure,
                            groupValue: _unlockCodeOption,
                            onChanged: (UnlockCodeOptions value) {
                              setState(() { _unlockCodeOption = value; });
                            },
                          ),
                          RadioListTile(
                            dense: false,
                            title: const Text(
                                'Never',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                )
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            value: UnlockCodeOptions.PasswordPolicyNone,
                            groupValue: _unlockCodeOption,
                            onChanged: (UnlockCodeOptions value) {
                              setState(() { _unlockCodeOption = value; });
                            },
                          ),
                      ])
                    )
                  ],
                ),
                SizedBox(height: 30),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Next'),
                  onPressed: () {
                  }
                )
              ])),
        ]));
  }

  Widget inputLine(context, label, obscureText) {
    return Container(
      width: 200,
      child: TextField(
        obscureText: obscureText,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).accentColor,
          ),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        autofocus: true,
        showCursor: true,
        autocorrect: false,
        enableInteractiveSelection: false,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

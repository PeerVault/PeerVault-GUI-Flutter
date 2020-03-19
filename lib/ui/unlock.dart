import 'package:flutter/material.dart';

class Unlock extends StatefulWidget {
  Unlock() : super();

  _Unlock createState() => _Unlock();
}

class _Unlock extends State<Unlock> {
  FocusNode _node1;
  FocusNode _node2;
  FocusNode _node3;
  FocusNode _node4;
  FocusNode _node5;
  FocusNode _node6;
  Map<int, String> nodeValues;

  @override
  void initState() {
    super.initState();
    // Text field initialization
    _node1 = FocusNode();
    _node2 = FocusNode();
    _node3 = FocusNode();
    _node4 = FocusNode();
    _node5 = FocusNode();
    _node6 = FocusNode();

    nodeValues = Map();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            Text(
              'Unlock your Vault',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  unlockCodeField(context, 0, _node1, _node1, _node2),
                  unlockCodeField(context, 1, _node1, _node2, _node3),
                  unlockCodeField(context, 2, _node2, _node3, _node4),
                  unlockCodeField(context, 3, _node3, _node4, _node5),
                  unlockCodeField(context, 4, _node4, _node5, _node6),
                  unlockCodeField(context, 5, _node5, _node6, _node6),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget unlockCodeField(
      BuildContext context,
      int index,
      FocusNode nodePrev,
      FocusNode nodeActive,
      FocusNode nodeNext
  ) {
    return Container(
      height: 60,
      width: 75,
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).accentColor
      ),
      child: TextFormField(
        autofocus: true,
        focusNode: nodeActive,
        showCursor: false,
        autocorrect: false,
        enableInteractiveSelection: false,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          fontSize: 30,
        ),
        maxLength: 1,
        maxLengthEnforced: true,
        buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
        decoration: InputDecoration.collapsed(
          hintText: "",
        ),
        onChanged: (value) {
          nodeValues[index] = value;
          nodeActive.unfocus();
          if (value.isEmpty) {
            FocusScope.of(context).requestFocus(nodePrev);
          } else {
            FocusScope.of(context).requestFocus(nodeNext);
          }

          String code = "";
          nodeValues.forEach((key, value) {
            code += value;
          });

          if (code.length == 6) {
            print("Code: " + code);
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:peervault/ui/home.dart';
import 'package:peervault/ui/owner/create_owner.dart';
import 'package:peervault/ui/unlock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF191919),
        primarySwatch: MaterialColor(
          0xFF24D07E,
          <int, Color>{
            50: Color(0xFFe5f9f0),
            100: Color(0xFFbdf1d8),
            200: Color(0xFF92e8bf),
            300: Color(0xFF66dea5),
            400: Color(0xFF45d791),
            500: Color(0xFF24D07E),
            600: Color(0xFF20cb76),
            700: Color(0xFF1bc46b),
            800: Color(0xFF16be61),
            900: Color(0xFF0db34e),
          }
        ),
        accentColor: Color(0xFF82E1B3),
        unselectedWidgetColor: Colors.white,
      ),
      initialRoute: '/createOwner',
      routes: {
        '/': (context) => Home(),
        '/unlock': (context) => Unlock(),
        '/createOwner': (context) => CreateOwner(),
      },
    );
  }
}
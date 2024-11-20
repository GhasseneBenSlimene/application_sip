import 'package:flutter/material.dart';
import 'home_page.dart';
import 'registration_page.dart';
import 'call_page.dart';
import 'settings_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIP UA App',
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal,
          secondary: Colors.orangeAccent,
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Couleur du texte
            backgroundColor: Colors.teal,  // Couleur de fond des boutons
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/registration': (context) => RegistrationPage(),
        '/call': (context) => CallPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

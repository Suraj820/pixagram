import 'package:flutter/material.dart';
import 'package:pixagram/pages/login_page.dart';
import 'package:pixagram/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      initialRoute: 'registration',
      routes: {
        'login': (context) => LoginPage(),
        'registration': (context) => RegistrationPage(),
      },
      home: LoginPage(),
    );
  }
}

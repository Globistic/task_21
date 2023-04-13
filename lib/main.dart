import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_21/screens/add_mobile_screen.dart';

void main() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.lime,
    );
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.from(colorScheme: colorScheme),
      color: Colors.lightGreen,
      home: AddMobileNumberScreen(),
    );
  }
}

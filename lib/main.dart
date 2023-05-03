import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/authScreen/add_mobile_screen.dart';
import 'package:loan_app/screens/homeScreens/dasbBoard_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsBinding widgetsFlutterBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isUser = prefs.getBool('isUser') ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blueGrey,
    );
    Widget initialScreen;
    if (isUser == true) {
      // If the user is a regular user, show the loan screen
      initialScreen = ProfileScreen();
    } else {
      // If the user is not logged in, show the mobile number screen
      initialScreen = AddMobileNumberScreen();
    }

    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.from(colorScheme: colorScheme),
      color: Colors.lightGreen,
      home: Scaffold(
        body:
        initialScreen,
      ),
    );
  }
}

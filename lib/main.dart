import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/add_mobile_screen.dart';
import 'package:loan_app/screens/dasbBoard_Screen.dart';
import 'package:loan_app/screens/home_screen.dart';
import 'package:loan_app/screens/main_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = ColorScheme.fromSwatch(
//       primarySwatch: Colors.lime,
//     );
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData.from(colorScheme: colorScheme),
//       color: Colors.lightGreen,
//
//     //  home: AddMobileNumberScreen(),
//
//       home: DashBoardScreen(),
//
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     Widget initialScreen = user != null ? DashBoardScreen() : AddMobileNumberScreen();
//
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData.from(colorScheme: colorScheme),
//       color: Colors.lightGreen,
//       home: initialScreen,
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget initialScreen = AddMobileNumberScreen();
    if (!_isLoading) {
      final user = FirebaseAuth.instance.currentUser;
      initialScreen = user != null ? DashBoardScreen() : AddMobileNumberScreen();
    }
    final ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blueGrey,
    );

    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.from(colorScheme: colorScheme),
      color: Colors.lightGreen,
      home: _isLoading
          ? Center(child: CircularProgressIndicator())
          : initialScreen,
    );
  }
}



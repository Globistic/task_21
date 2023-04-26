import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loan_app/screens/adminScrrens/adminScreen.dart';
import 'package:loan_app/screens/authScreen/add_mobile_screen.dart';
import 'package:loan_app/screens/authScreen/loginWithEmailScreen.dart';
import 'package:loan_app/screens/homeScreens/dasbBoard_Screen.dart';
import 'package:loan_app/screens/homeScreens/home_screen.dart';
import 'package:loan_app/screens/homeScreens/my_account.dart';
import 'package:loan_app/screens/main_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsFlutterBinding =
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool isAdmin = false;
  bool isUser = false;

  int _currentIndex = 0;

  final List<Widget> _children = [
    AddMobileNumberScreen(), // Initial screen is AddMobileNumberScreen
    LoanScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isAdmin = prefs.getBool('isAdmin') ?? false;
        isUser = prefs.getBool('isUser') ?? false;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blueGrey,
    );
    Widget initialScreen = AddMobileNumberScreen();
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
        //LoginWithEmailScreen(),

          initialScreen,

        // _children[_currentIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.lightGreenAccent,
        //   onTap: onTabTapped,
        //   currentIndex: _currentIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       activeIcon: FaIcon(
        //         FontAwesomeIcons.home,
        //         size: 22,
        //         color: Colors.black,
        //       ),
        //       icon: FaIcon(
        //         FontAwesomeIcons.home,
        //         size: 22,
        //         color: Colors.grey,
        //       ),
        //       label: 'Home', // Change the label to "Home"
        //     ),
        //     BottomNavigationBarItem(
        //       activeIcon: FaIcon(
        //         FontAwesomeIcons.person,
        //         size: 22,
        //         color: Colors.black,
        //       ),
        //       icon: FaIcon(
        //         FontAwesomeIcons.person,
        //         size: 22,
        //         color: Colors.grey,
        //       ),
        //       label: 'My Account',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;
//   bool isAdmin = false;
//   bool isUser = false;
//
//
//   int _currentIndex = 0;
//
//   final List<Widget> _children = [
//
//     LoanScreen(),
//     ProfileScreen(),
//   ];
//
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAuth.instance.authStateChanges().listen((user) async {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       setState(() {
//         isAdmin = prefs.getBool('isAdmin') ?? false;
//         isAdmin = prefs.getBool('isUser') ?? false;
//         _isLoading = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget initialScreen = AddMobileNumberScreen();
//     if (!_isLoading) {
//       if (isAdmin == true) {
//         initialScreen = AdminDashboardScreen();
//       } else if (isUser == true) {
//         initialScreen = ProfileScreen();
//       } else {
//         initialScreen = AddMobileNumberScreen();
//       }
//     }
//     final ColorScheme colorScheme = ColorScheme.fromSwatch(
//       primarySwatch: Colors.blueGrey,
//     );
//
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData.from(colorScheme: colorScheme),
//       color: Colors.lightGreen,
//       home:
//       Scaffold(
//         body: _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.lightGreenAccent,
//           onTap: onTabTapped,
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//         activeIcon:  FaIcon(FontAwesomeIcons.home,size: 22,color: Colors.black,),
//
//               icon: new   FaIcon(FontAwesomeIcons.home,size: 22,color: Colors.grey,),
//               label: 'Loan ',
//             ),
//             BottomNavigationBarItem(activeIcon: FaIcon(FontAwesomeIcons.person,size: 22,color: Colors.black,),
//
//               icon: new   FaIcon(FontAwesomeIcons.person,size: 22,color: Colors.grey,),
//               label: 'My Account',
//             ),
//           ],
//         ),
//       ),
//
//       // DashBoardScreen()
//     //  home: AddMobileNumberScreen()
//       // _isLoading
//       //     ? Center(child: CircularProgressIndicator())
//       //     : initialScreen,
//     );
//   }
// }

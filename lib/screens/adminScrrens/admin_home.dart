import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/adminScrrens/adminScreen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:loan_app/screens/adminScrrens/send_notification_screen.dart';
import 'add_tax_screen.dart';
import 'admin_check_status.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightGreen,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Padding(
          padding:  EdgeInsets.all(30.0),
          child: Text('Admin Home'),
        ),

          NeumorphicButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  SendNotificationScreen(),
                ),
              );


            },
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(30),
              ),
              depth: 1,
            ),
            child: Center(
              child: Text(
                'Send Notification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
          ),


          NeumorphicButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  AdminDashboardScreen(),
                ),
              );


            },
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(30),
              ),
              depth: 1,
            ),
            child: Center(
              child: Text(
                'Show Users',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
          ),

          NeumorphicButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  TaxScreen(),
                ),
              );


            },
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(30),
              ),
              depth: 1,
            ),
            child: Center(
              child: Text(
                'Add Tax',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
          ),

        ],
      ),
    );
  }
}

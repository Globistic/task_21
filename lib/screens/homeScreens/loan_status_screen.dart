import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;




class LoanStatusScreen extends StatefulWidget {
  const LoanStatusScreen({Key? key}) : super(key: key);

  @override
  _LoanStatusScreenState createState() => _LoanStatusScreenState();
}

class _LoanStatusScreenState extends State<LoanStatusScreen> {
  late Stream<DocumentSnapshot> _loanStatusStream;


  String? _loanStatus; // assign default value
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getUserStatus();
    FlutterNativeSplash.remove();


  }
  getUserStatus(){
    setState(() {
      _loanStatusStream = FirebaseFirestore.instance
          .collection('userStatus')
          .doc(_firebaseAuth.currentUser?.uid)
          .snapshots();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Loan Status'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _loanStatusStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
            snapshot.data?.data() as Map<String, dynamic>?;
            if (data != null) {
              _loanStatus = data['userStatus'] ?? '';
            }
          }
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loan Application Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 8,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12)),
                    color: _loanStatus == 'Approved'
                        ? Colors.green[200]
                        : Colors.grey[400],
                  ),
                  child: ListTile(
                    title: Text('Approved'),
                    trailing:
                    Icon(Icons.check_circle, color: Colors.green),
                  ),
                ),
                SizedBox(height: 10.0),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 8,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12)),
                    color: _loanStatus == "In Review"
                        ? Colors.orange[200]
                        : Colors.grey[400],
                  ),
                  child: ListTile(
                    title: Text('In Review'),
                    trailing: Icon(Icons.hourglass_empty, color: Colors.orange),
                  ),
                ),
                SizedBox(height: 10.0),
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 8,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12)),
                    color: _loanStatus == 'Rejected'
                        ? Colors.red[200]
                        : Colors.grey[400],
                  ),
                  child: ListTile(
                    title: Text('Rejected'),
                    trailing: Icon(Icons.cancel, color: Colors.red),
                  ),
                ),
                SizedBox(height: 40.0),
                Center(
                  child: NeumorphicButton(
                    onPressed: () {
                      setState(() {
                        getUserStatus();

                      });
                      print("${_loanStatus.toString()}");
                    },
                    style: NeumorphicStyle(
                      depth: 8,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


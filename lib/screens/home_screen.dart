import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/wallet_screen.dart';

import 'emergency_contact_screen.dart';
import 'lending_amount_screen.dart';
import 'loan_status_screen.dart';
import 'loan_terms_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: SizedBox(),
            backgroundColor: Colors.grey[300],
            centerTitle: true,
            title: Text(
              'HOME ',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.lightGreen,
          body: Center(
            child: Container(
              color: Colors.lightGreen,
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Neumorphic(
                  padding: const EdgeInsets.all(20),
                  style: const NeumorphicStyle(
                    color: Colors.lightGreen,
                    depth: 2,
                    intensity: 0.8,
                    shape: NeumorphicShape.flat,
                  ),
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: const EdgeInsets.all(15),
                        style: NeumorphicStyle(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LendingAmountScreen()),
                          );
                        },
                        child: Text('Amount'),
                      ),
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: const EdgeInsets.all(15),
                        style: NeumorphicStyle(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EmergencyContactsScreen()),
                          );
                        },
                        child: Text('Emergency'),
                      ),
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: const EdgeInsets.all(15),
                        style: NeumorphicStyle(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletScreen()),
                          );
                        },
                        child: Text('WalletScreen'),
                      ),
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: const EdgeInsets.all(15),
                        style: NeumorphicStyle(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoanStatusScreen()),
                          );
                        },
                        child: Text('Loan Status'),
                      ),
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: const EdgeInsets.all(15),
                        style: NeumorphicStyle(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoanTermsScreen()),
                          );
                        },
                        child: Text('Terms & Condition'),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ]),
                  )),
            ),
          )),
    );
  }
}

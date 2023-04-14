import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/utils.dart';

import 'allow_map_permission.dart';

class OTPScreen extends StatefulWidget {
  final verificationId;
  final phNo;

  const OTPScreen({Key? key, required this.verificationId , this.phNo}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  
  late final String? phoneNumber;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController smsCode = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  bool isValidOTP(String value) {
    if (value == null || value.isEmpty) {
      // Phone number cannot be null or empty
      return false;
    }
    if (value.length != 6) {
      // Phone number must be exactly 6 digits long
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      // Phone number must contain only digits
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 108.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter the OTP',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'We have sent a verification code to your mobile number',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: 2,
                        intensity: 0.8,
                        shape: NeumorphicShape.flat,
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter 6 digit  OTP';
                          }
                          if (!isValidOTP(value!)) {
                            return 'Please enter a  OTP';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          smsCode.text = value.toString();
                        },
                        controller: smsCode,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter OTP',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 30),
                    NeumorphicButton(

                      onPressed: () async {


                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {


                          setState(() {
                            loading = true;

                          });
                          final credientilas = PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: smsCode.text.toString());
                          try {
                            await _auth.signInWithCredential(credientilas);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MapScreen(ph_NoController: widget.phNo, )),
                            );
                          } catch (e) {
                            setState(() {
                              loading = false;
                            });
                            Utils.toastMessage(e.toString());
                          }
                        }




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
                          loading ? 'Loading...' : 'Submit',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

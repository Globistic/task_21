import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/utils.dart';

import 'allow_map_permission.dart';

class OTPScreen extends StatefulWidget {
  final verificationId;

  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final String? phoneNumber;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController smsCode = TextEditingController();
  bool loading = false;

  // void _signInWithPhoneNumber() async {
  //   try {
  //     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId.toString(),
  //       smsCode: smsCode.text,
  //     );
  //     await _auth.signInWithCredential(credential);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MapScreen()),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Container(
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
              child: TextField(
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
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  Utils.toastMessage(e.toString());
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
    );
  }
}

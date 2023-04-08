import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/personal_info_screen.dart';
import 'package:task_21/screens/selfi_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // double progressValue = 0.0;
  //
  // void navigateToNextScreen() {
  //   // Navigate to the next screen and update the progress value
  //   setState(() {
  //     progressValue += 0.3;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightGreen[400],
          body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            LinearProgressIndicator(
                              value: 0.2, // 10% as decimal value
                              backgroundColor: Colors.grey[300],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              semanticsLabel: 'Linear progress indicator',
                            ),
                            Positioned(
                              top: 2,
                              bottom: 2,
                              left: 2,
                              right: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '10%',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Registration Form',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Please fill out the following details:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 40),
                        Neumorphic(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(20),
                          style: const NeumorphicStyle(
                            color: Colors.lightGreen,
                            depth: 2,
                            intensity: 0.8,
                            shape: NeumorphicShape.flat,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CNIC Front Photo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: NeumorphicButton(
                                  padding: const EdgeInsets.all(20),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelfieScreen()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Take Photo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'CNIC Back Photo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: NeumorphicButton(
                                  padding: const EdgeInsets.all(20),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelfieScreen()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Take Photo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Neumorphic(
                            padding: const EdgeInsets.all(20),
                            style: const NeumorphicStyle(
                              color: Colors.lightGreen,
                              depth: 2,
                              intensity: 0.8,
                              shape: NeumorphicShape.flat,
                            ),
                            child: Column(children: [
                              Text("Your Personal Information"),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  labelText: 'Complete Name',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'CNIC Number',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'CNIC Exipry',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Date of Birth',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Current Address',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Present Address',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              NeumorphicButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PersonalInfoScreen()),
                                  );
                                },
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(30),
                                  ),
                                  depth: 1,
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ]))
                      ])))),
    );
  }
}

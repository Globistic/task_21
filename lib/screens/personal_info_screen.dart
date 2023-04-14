import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'bill_card_screen.dart';
import 'lending_amount_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  final map_longitude;
  final map_latitude;
  final ph_NoController;
  final name;
  final cnicName;
  final cnicNo;
  final cnicExpiry;
  final dob;
  final currentAddress;
  final persentAddress;
  final File? cnicFront;
  final File? cnicBack;
  final File? userSelfiWithCnic;
  final File? userSelfi;

  const PersonalInfoScreen({
    Key? key,
    required this.map_latitude,
    required this.name,
    required this.ph_NoController,
    required this.map_longitude,
    required this.cnicName,
    required this.cnicNo,
    required this.cnicExpiry,
    required this.dob,
    required this.currentAddress,
    required this.persentAddress,
    required this.cnicBack,
    required this.cnicFront,
    required this.userSelfiWithCnic,
    required this.userSelfi,
  }) : super(key: key);


  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String? maritalStatus = '';
  TextEditingController marriedStatus = TextEditingController()
;  TextEditingController noOfChildern = TextEditingController();
  TextEditingController qualification = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: LinearProgressIndicator(
                          value: 0.7, // 20% as decimal value
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '70%',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),)

                    ],
                  ),
                  Center(
                    child: const Text(
                      'Married Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Select In The Polloing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: const NeumorphicStyle(
                      color: Colors.lightGreen,
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    maritalStatus = 'Single';
                                    marriedStatus.text = maritalStatus!;
                                  });
                                },
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 10,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                    lightSource: LightSource.topLeft,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.person,
                                      color:  maritalStatus == 'Single'
                                          ? Colors.blue
                                          : Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Single',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    maritalStatus = 'Married';
                                    marriedStatus.text = maritalStatus!;
                                  });
                                },
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 10,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.people,
                                      color:  maritalStatus == 'Married'
                                          ? Colors.blue
                                          : Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Married',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    maritalStatus = 'Widow';
                                    marriedStatus.text = maritalStatus!;
                                  });
                                },
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 2,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.remove_circle,
                                      color:  maritalStatus == 'Widow'
                                          ? Colors.blue
                                          : Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Widow',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    maritalStatus = 'Divorced';
                                    marriedStatus.text = maritalStatus!;
                                  });

                                },
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    depth: 2,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.mood_bad,
                                      color:  maritalStatus == 'Divorced'
                                          ? Colors.blue
                                          : Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Divorced',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: noOfChildern,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'How Many Childers You Have With You',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: qualification,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Your Qualification',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BillCardScreen(
                              name: widget.name,
                              map_latitude: widget.map_latitude,
                              map_longitude: widget.map_longitude ,
                              ph_NoController: widget.ph_NoController,
                              cnicExpiry: widget.cnicExpiry,
                              cnicNo: widget.cnicNo,
                              cnicName: widget.cnicName ,
                              currentAddress: widget.currentAddress ,
                              dob: widget.dob,
                              persentAddress: widget.persentAddress,
                              mariedStatus:  marriedStatus.text,
                        //      noOfChildern: noOfChildern.text,
                        //      qualification: qualification.text,
                              cnicFront: widget.cnicFront,
                              cnicBack: widget.cnicBack,
                              selfi: widget.userSelfi,
                              selfiWithCNIC: widget.userSelfiWithCnic,
                            )
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
                        'Submit',
                        style: TextStyle(
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
    );
  }
}

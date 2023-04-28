import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'emergency_contact_screen.dart';

class BillCardScreen extends StatefulWidget {
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
  // final  qualification;
//  final  noOfChildern;
  final mariedStatus;
  final cnicFront;
  final cnicBack;
  final selfi;
  final selfiWithCNIC;

  const BillCardScreen(
      {Key? key,
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
      // required this./qualification,
      // required this.noOfChildern,
      required this.mariedStatus,
      required this.cnicFront,
      required this.cnicBack,
      required this.selfi,
      required this.selfiWithCNIC})
      : super(key: key);

  @override
  _BillCardScreenState createState() => _BillCardScreenState();
}

class _BillCardScreenState extends State<BillCardScreen> {
  File? bill_card_pic;
  bool showSpiner = false;

  Future<void> _getImageFromCameraOrGallery(bool isFront) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isFront ? ImageSource.camera : ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          bill_card_pic = File(pickedFile.path);
        } else {
          bill_card_pic = File(pickedFile.path);
        }
      });
    }

    final Reference storageRef =
        FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    final TaskSnapshot taskSnapshot =
        await storageRef.putFile(File(pickedFile!.path));

    final String downloadUrl = await storageRef.getDownloadURL();

    print('File Uploaded: $downloadUrl');
  }

  String? selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top:20,bottom: 20),
                child: Column(
                  children: [
                    Text('You Have Completed Your Profile'),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: LinearProgressIndicator(
                            value: 0.8, // 90% as decimal value
                            backgroundColor: Colors.grey[300],
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blue),
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Select Atleast One',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'Business Card';
                              selected = selected!;
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
                                color: selected == 'Business Card'
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Business Card !',
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
                              selected = 'Student Card';
                              selected = selected!;
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
                                color: selected == 'Student Card'
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Student Card',
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
                              selected = 'Utility Bill';
                              selected = selected!;
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
                                color: selected == 'Utility Bill'
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Utility bill',
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
              selected.isNotEmptyAndNotNull
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Take Photo of ${selected}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          NeumorphicButton(
                            onPressed: () {
                              _getImageFromCameraOrGallery(true);
                            },
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Take Photo Of ${selected}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (bill_card_pic != null)
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Image.file(
                                  bill_card_pic!,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              NeumorphicButton(
                onPressed: () {
                  if (bill_card_pic == null) {
                    // Show an error message to the user if either photo is null
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Please take atlest 1 pictures from the following"),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergencyContactsScreen(
                                name: widget.name,
                                map_latitude: widget.map_latitude,
                                map_longitude: widget.map_longitude,
                                ph_NoController: widget.ph_NoController,
                                cnicExpiry: widget.cnicExpiry,
                                cnicNo: widget.cnicNo,
                                cnicName: widget.cnicName,
                                currentAddress: widget.currentAddress,
                                dob: widget.dob,
                                persentAddress: widget.persentAddress,
                                mariedStatus: widget.mariedStatus,
                                //  noOfChildern: widget.noOfChildern,
                                //   qualification: widget.qualification,
                                loanAmount: 55,
                                cnicFront: widget.cnicFront,
                                cnicBack: widget.cnicBack,
                                bill_card_pic: bill_card_pic,
                                selfi: widget.selfi,
                                selfiWithCNIC: widget.selfiWithCNIC,
                              )),
                    );
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
    );
  }
}

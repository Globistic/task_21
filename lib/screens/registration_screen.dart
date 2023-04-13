import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/personal_info_screen.dart';
import 'package:task_21/screens/selfiCNIC_screen.dart';
import 'package:task_21/screens/selfi_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  final map_longitude;
  final map_latitude;
  final ph_NoController;
  final name;

  const RegistrationScreen(
      {Key? key,
      required this.map_latitude,
      required this.name,
      required this.ph_NoController,
      required this.map_longitude})
      : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController cnicName = TextEditingController();
  TextEditingController cnicNo = TextEditingController();
  TextEditingController cnicExpiry = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController currentAderss = TextEditingController();
  TextEditingController presentAderss = TextEditingController();

  File? cnicFrontPhoto;
  File? cnicBackPhoto;
  bool showSpiner = false;

  Future<void> _getImageFromCameraOrGallery(bool isFront) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isFront ? ImageSource.camera : ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          cnicFrontPhoto = File(pickedFile.path);
        } else {
          cnicBackPhoto = File(pickedFile.path);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightGreen[400],
          body: Form(
            child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: LinearProgressIndicator(
                                  value: 0.2, // 20% as decimal value
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '20%',
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
                                NeumorphicButton(
                                  onPressed: () {
                                    _getImageFromCameraOrGallery(true);
                                  },
                                  padding: const EdgeInsets.all(20),
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
                                if (cnicFrontPhoto != null)
                                  Image.file(
                                    cnicFrontPhoto!,
                                    height: 200,
                                    width: 200,
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
                                NeumorphicButton(
                                  onPressed: () {
                                    _getImageFromCameraOrGallery(false);
                                  },
                                  padding: const EdgeInsets.all(20),
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
                                if (cnicBackPhoto != null)
                                  Image.file(
                                    cnicBackPhoto!,
                                    height: 200,
                                    width: 200,
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
                                TextFormField(
                                  controller: cnicName,
                                  decoration: InputDecoration(
                                    focusColor: Colors.black,
                                    labelText: 'CNIC Name',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: cnicNo,
                                  decoration: InputDecoration(
                                    hintText: '12101-6922562-1',
                                    labelText: 'CNIC Number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: cnicExpiry,
                                        decoration: InputDecoration(
                                          labelText: 'CNIC Expiry',
                                          border: OutlineInputBorder(),
                                        ),
                                        onTap: () async {
                                          // Show the date picker and wait for user to select a date
                                          DateTime? selectedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            // Set the date in the controller
                                            cnicExpiry.text = selectedDate
                                                .toIso8601String()
                                                .split('T')[0];
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: dob,
                                        decoration: InputDecoration(
                                          labelText: 'Date Of Birth',
                                          border: OutlineInputBorder(),
                                        ),
                                        onTap: () async {
                                          // Show the date picker and wait for user to select a date
                                          DateTime? selectedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900, 1, 1),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            // Set the date in the controller
                                            dob.text = selectedDate
                                                .toIso8601String()
                                                .split('T')[0];
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: currentAderss,
                                  decoration: InputDecoration(
                                    labelText: 'Current Address',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: presentAderss,
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
                                          builder: (context) => SelfiCNICScreen(
                                                name: widget.name,
                                                map_latitude:
                                                    widget.map_latitude,
                                                map_longitude:
                                                    widget.map_longitude,
                                                ph_NoController:
                                                    widget.ph_NoController,
                                                cnicExpiry: cnicExpiry.text,
                                                cnicNo: cnicNo.text,
                                            cnicName: cnicName.text,
                                                currentAddress:
                                                    currentAderss.text,
                                                dob: dob.text,
                                                persentAddress:
                                                    presentAderss.text,

                                                cnicFront:
                                                    cnicFrontPhoto, // Pass the CNIC front image file
                                                cnicBack:
                                                    cnicBackPhoto, // Pass the CNIC back image file
                                              )),
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
                        ]))),
          )),
    );
  }
}

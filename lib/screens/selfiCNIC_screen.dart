import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_21/screens/personal_info_screen.dart';

class SelfiCNICScreen extends StatefulWidget {
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

  const SelfiCNICScreen({
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
  }) : super(key: key);

  @override
  State<SelfiCNICScreen> createState() => _SelfiCNICScreenState();
}

class _SelfiCNICScreenState extends State<SelfiCNICScreen> {
  File? userSelfi;
  File? userSelfiWithCnic;
  bool showSpiner = false;

  Future<void> _getImageFromCameraOrGallery(bool isFront) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isFront ? ImageSource.camera : ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          userSelfi = File(pickedFile.path);
        } else {
          userSelfiWithCnic = File(pickedFile.path);
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
                                  value: 0.5, // 50% as decimal value
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
                                    '50%',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),)

                            ],
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Selfi Screen',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Capture Following Images',
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
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Front Photo',
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
                                        'Take Selfi',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (userSelfi != null)
                                  Image.file(
                                    userSelfi!,
                                    height: 200,
                                    width: 200,
                                  ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Selfi With CNIC',
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
                                        'Take Selfi With CNIC',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (userSelfiWithCnic != null)
                                  Image.file(
                                    userSelfiWithCnic!,
                                    height: 200,
                                    width: 200,
                                  ),
                              ],
                            ),
                          ),
                          NeumorphicButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalInfoScreen(
                                          name: widget.name,
                                          map_latitude: widget.map_latitude,
                                          map_longitude: widget.map_longitude,
                                          ph_NoController:
                                              widget.ph_NoController,
                                          cnicExpiry: widget.cnicExpiry,
                                          cnicNo: widget.cnicNo,
                                      cnicName: widget.cnicName,
                                          currentAddress: widget.currentAddress,
                                          dob: widget.dob,
                                          persentAddress: widget.persentAddress,
                                          cnicFront:
                                          widget.cnicFront, // Pass the CNIC front image file
                                          cnicBack:
                                          widget.cnicBack,
                                      userSelfi: userSelfi ,
                                      userSelfiWithCnic: userSelfiWithCnic ,
                                      // Pass the CNIC back image file
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
                        ]))),
          )),
    );
  }
}

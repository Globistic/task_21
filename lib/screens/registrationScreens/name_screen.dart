import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/registrationScreens/registration_screen.dart';

class NameScreen extends StatefulWidget {

  final map_longitude;
  final map_latitude;
  final ph_NoController;

  const NameScreen({Key? key, required this.map_latitude , required this.ph_NoController , required this.map_longitude}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child:
                Form(
                  key: _formKey,
                  child: Column(children: [

                    Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: LinearProgressIndicator(
                              value: 0.1, // 10% as decimal value
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
                                '10%',
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
                    ),
                    Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text(
                          'Enter Your Name',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Please enter your first name and last name',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [

                            Expanded(
                              child: Neumorphic(
                                margin: const EdgeInsets.only(right: 10),
                                style: NeumorphicStyle(
                                  depth: 2,
                                  intensity: 0.8,
                                  shape: NeumorphicShape.flat,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0.5,
                                  horizontal: 10,
                                ),
                                child: TextFormField(
                                  controller: firstName,
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                      return 'Please enter a valid first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Neumorphic(
                                margin: const EdgeInsets.only(left: 10),
                                style: NeumorphicStyle(
                                  depth: 2,
                                  intensity: 0.8,
                                  shape: NeumorphicShape.flat,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0.5,
                                  horizontal: 10,
                                ),
                                child: TextFormField(
                                  controller: lastName,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your last name';
                                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                      return 'Please enter a valid last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 30),
                        NeumorphicButton(
                          onPressed: () {

                            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    RegistrationScreen(

                                      ph_NoController: widget.ph_NoController,
                                      map_longitude: widget.map_longitude,
                                      map_latitude: widget.map_latitude,
                                      name: '${firstName.text} ${lastName
                                          .text}',)),);
                            }
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],

                      ),
                    ),
            ]
                  ),
                ),

          ),
        ),
      ),
    );
  }
}

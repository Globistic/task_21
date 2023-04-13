import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/emergency_contact_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class LendingAmountScreen extends StatefulWidget {

  final  map_longitude;
  final  map_latitude;
  final  ph_NoController;
  final  name;
  final  cnicName;
  final  cnicNo;
  final  cnicExpiry;
  final  dob;
  final  currentAddress;
  final  persentAddress;
  final  qualification;
  final  noOfChildern;
  final  mariedStatus;
  final  cnicFront;
  final  cnicBack;


  const LendingAmountScreen({
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
    required this.qualification,
    required this.noOfChildern,
    required this.mariedStatus,
    required this.cnicFront,
    required this.cnicBack
  }) : super(key: key);




  @override
  _LendingAmountScreenState createState() => _LendingAmountScreenState();
}

class _LendingAmountScreenState extends State<LendingAmountScreen> {
  int _selectedAmount = 3000;

  Widget _buildAmountButton(int amount) {
    return NeumorphicButton(
      onPressed: () {
        setState(() {
          _selectedAmount = amount;
        });
      },
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      style: NeumorphicStyle(
        color: _selectedAmount == amount ? Color(0xFF4A83FE) : null,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        depth: _selectedAmount == amount ? 8 : 0,
      ),
      child: Center(
        child: Text(
          'Rs: $amount /-',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: _selectedAmount == amount ? Colors.white : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, top: 30, left: 20, right: 20),
              child: Stack(
                children: [
                  LinearProgressIndicator(
                    value: 0.7, // 10% as decimal value
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Select the amount you want to lend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.all(10),
              child: Neumorphic(
                margin: const EdgeInsets.only(top: 10),
                style: NeumorphicStyle(
                  depth: 2,
                  color: Colors.transparent,
                  intensity: 0.8,
                  shape: NeumorphicShape.flat,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'First Time',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildAmountButton(3000),
            Padding(
              padding: EdgeInsets.all(10),
              child: Neumorphic(
                margin: const EdgeInsets.only(top: 10),
                style: NeumorphicStyle(
                  depth: 2,
                  color: Colors.transparent,
                  intensity: 0.8,
                  shape: NeumorphicShape.flat,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Second Time',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildAmountButton(6000),
            Padding(
              padding: EdgeInsets.all(10),
              child: Neumorphic(
                margin: const EdgeInsets.only(top: 10),
                style: NeumorphicStyle(
                  depth: 2,
                  color: Colors.transparent,
                  intensity: 0.8,
                  shape: NeumorphicShape.flat,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Third Time',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildAmountButton(10000),
            SizedBox(height: 40),
            NeumorphicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyContactsScreen(

                        name: widget.name,
                        map_latitude: widget.map_latitude,
                        map_longitude: widget.map_longitude ,
                        ph_NoController: widget.ph_NoController,
                        cnicExpiry: widget.cnicExpiry,
                        cnicNo: widget.cnicNo,
                        cnicName: widget.cnicName ,
                        currentAddress: widget.currentAddress,
                        dob: widget.dob,
                        persentAddress: widget.persentAddress,
                        mariedStatus: widget.mariedStatus,
                        noOfChildern: widget.noOfChildern,
                        qualification: widget.qualification,
                        loanAmount: _selectedAmount.text,
                        cnicFront: widget.cnicFront,
                        cnicBack: widget.cnicBack,
                        bill_card_pic: widget.cnicBack,
                        selfi: widget.cnicBack,
                        selfiWithCNIC: widget.cnicBack,



                      )),
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
    ));
  }
}

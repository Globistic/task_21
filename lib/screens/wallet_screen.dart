import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String _selectedWallet = '';
  final _easypaisaController = TextEditingController();
  final _jazzcashController = TextEditingController();

  @override
  void dispose() {
    _easypaisaController.dispose();
    _jazzcashController.dispose();
    super.dispose();
  }

  void _selectWallet(String wallet) {
    setState(() {
      _selectedWallet = wallet;
    });
  }

  void _submitForm() {
    if (_selectedWallet == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please select a wallet'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    } else if (_selectedWallet == 'easypaisa' &&
        _easypaisaController.text == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter your Easypaisa account number'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    } else if (_selectedWallet == 'jazzcash' &&
        _jazzcashController.text == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter your JazzCash account number'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    } else {
      // Submit form
      // Code for submitting form goes here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Wallet'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NeumorphicButton(
                onPressed: () {
                  _selectWallet('easypaisa');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Easypaisa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(30),
                  ),
                  depth: 5,
                  intensity: 0.7,
                  color: _selectedWallet == 'easypaisa'
                      ? Colors.blue[200]
                      : Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              NeumorphicButton(
                onPressed: () {
                  _selectWallet('jazzcash');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'JazzCash',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(30),
                  ),
                  depth: 5,
                  intensity: 0.7,
                  color: _selectedWallet == 'jazzcash'
                      ? Colors.blue[200]
                      : Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              NeumorphicButton(
                onPressed: () {
                  // TODO: Implement onPressed
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 50),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: NeumorphicStyle(
                  color: Colors.blue,
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(20),
                  ),
                  depth: 8,
                  intensity: 0.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

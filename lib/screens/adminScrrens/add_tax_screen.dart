import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as adduser;
import 'package:flutter/material.dart';

class TaxScreen extends StatefulWidget {
  @override
  _TaxScreenState createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  final _interestController = TextEditingController();
  final _gstController = TextEditingController();
  final _termsController = TextEditingController();
  final _serviceFeeController = TextEditingController();

  double loanAmount = 0;



  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _interestController.dispose();
    _gstController.dispose();
    _termsController.dispose();
    _serviceFeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Tax Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _interestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Interest',
              ),
            ),
            TextField(
              controller: _gstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'GST',
              ),
            ),
            TextField(
              controller: _termsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Terms',
              ),
            ),
            TextField(
              controller: _serviceFeeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Service Fee',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save Taxes'),
              onPressed: () {
                _saveTaxes();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveTaxes() async {
    final interest = double.parse(_interestController.text);
    final gst = double.parse(_gstController.text);
    final terms = double.parse(_termsController.text);
    final serviceFee = double.parse(_serviceFeeController.text);

    final userDoc = await adduser.FirebaseFirestore.instance
        .collection('admin')
        .doc("tax")
        .set({
      'interest': interest,
      'gst': gst,
      'terms': terms,
      'serviceFee': serviceFee,
    }).then((_) {
      Navigator.pop(context);
    });
  

  }
}


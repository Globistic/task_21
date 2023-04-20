import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoanStatusScreen extends StatelessWidget {
  const LoanStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Loan Status'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Application Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            Neumorphic(
              style: NeumorphicStyle(
                depth: 8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: Colors.green[200],
              ),
              child: ListTile(
                title: Text('Approved'),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              ),
            ),
            SizedBox(height: 10.0),
            Neumorphic(
              style: NeumorphicStyle(
                depth: 8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: Colors.orange[200],
              ),
              child: ListTile(
                title: Text('In Review'),
                trailing: Icon(Icons.hourglass_empty, color: Colors.orange),
              ),
            ),
            SizedBox(height: 10.0),
            Neumorphic(
              style: NeumorphicStyle(
                depth: 8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: Colors.red[200],
              ),
              child: ListTile(
                title: Text('Rejected'),
                trailing: Icon(Icons.cancel, color: Colors.red),
              ),
            ),
            SizedBox(height: 40.0),
            Center(
              child: NeumorphicButton(
                onPressed: () {
                  // Add animation code here
                },
                style: NeumorphicStyle(
                  depth: 8,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

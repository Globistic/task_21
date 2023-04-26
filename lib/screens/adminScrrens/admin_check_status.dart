// import 'package:flutter/material.dart';
//
// class CheckStatus extends StatefulWidget {
//   const CheckStatus({Key? key}) : super(key: key);
//
//   @override
//   State<CheckStatus> createState() => _CheckStatusState();
// }
//
// class _CheckStatusState extends State<CheckStatus> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.lightGreen,
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreen,
//         title: Text('CHECK STATUS'),),);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoanStatusScreenAdmin extends StatefulWidget {
  final String userId;

  LoanStatusScreenAdmin({required this.userId});

  @override
  _LoanStatusScreenAdminState createState() => _LoanStatusScreenAdminState();
}

class _LoanStatusScreenAdminState extends State<LoanStatusScreenAdmin> {
  String _status = 'In Review';
  bool _isApproved = false;

  @override
 initState()  {
    super.initState();
    _getStatus();

  }

  Future<void> _getStatus() async {
    final doc = await FirebaseFirestore.instance
        .collection('loan_status')
        .doc(widget.userId)
        .get();

    if (doc.exists) {
      setState(() {
        _status = doc['status'];
        _isApproved = doc['isApproved'];
      });
    }
  }

  Future<void> _updateStatus() async {
    await FirebaseFirestore.instance
        .collection('loan_status')
        .doc(widget.userId)
        .set({
      'status': _status,
      'isApproved': _isApproved,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                color: _status == 'Approved'
                    ? Colors.green[200]
                    : Colors.grey[200],
              ),
              child: ListTile(
                title: Text('Approved'),
                trailing: Icon(Icons.check_circle,
                    color: _status == 'Approved' ? Colors.green : null),
                onTap: () {
                  setState(() {
                    _status = 'Approved';
                    _isApproved = true;
                  });
                  _updateStatus();
                },
              ),
            ),
            SizedBox(height: 10.0),
            Neumorphic(
              style: NeumorphicStyle(
                depth: 8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: _status == 'In Review'
                    ? Colors.orange[200]
                    : Colors.grey[200],
              ),
              child: ListTile(
                title: Text('In Review'),
                trailing: Icon(Icons.hourglass_empty,
                    color: _status == 'In Review' ? Colors.orange : null),
                onTap: () {
                  setState(() {
                    _status = 'In Review';
                    _isApproved = false;
                  });
                  _updateStatus();
                },
              ),
            ),
            SizedBox(height: 10.0),
            Neumorphic(
              style: NeumorphicStyle(
                depth: 8,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color:
                    _status == 'Rejected' ? Colors.red[200] : Colors.grey[200],
              ),
              child: ListTile(
                title: Text('Rejected'),
                trailing: Icon(Icons.cancel,
                    color: _status == 'Rejected' ? Colors.red : null),
                onTap: () {
                  setState(() {
                    _status = 'Rejected';
                    _isApproved = false;
                  });
                  _updateStatus();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

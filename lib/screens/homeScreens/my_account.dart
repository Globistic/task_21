import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightGreenAccent,
    appBar: AppBar(title: Text('Text',style:
    TextStyle(color: Colors.black,fontSize: 22),), elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        actions: [Padding(
          padding: const EdgeInsets.only(
              right: 18.0),
          child: Row(
            children: [

              FaIcon(FontAwesomeIcons.bell,size: 22,color: Colors.black,),
              SizedBox(width: 20,),
              FaIcon(FontAwesomeIcons.phone,size: 22,color: Colors.black,),

            ],
          ),
        )]),
    );
  }
}

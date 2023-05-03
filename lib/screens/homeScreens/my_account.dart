import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoanScreen extends StatefulWidget {

  final  userId;
  final  name;

  const LoanScreen({Key? key, required this.userId, required this.name}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

  }

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

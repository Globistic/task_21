import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {

   HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<String> dummyData = [

  ];

  @override
  void initState() {

    super.initState();

    FlutterNativeSplash.remove();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: dummyData.length == 0    ? Center(child: Text('No Record Found')) : Text(dummyData[index]),
          );
        },
      ),
    );
  }
}


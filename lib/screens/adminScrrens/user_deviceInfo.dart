import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDeviceInfo extends StatefulWidget {
  final String userId;

  const UserDeviceInfo({required this.userId, Key? key}) : super(key: key);

  @override
  State<UserDeviceInfo> createState() => _UserDeviceInfoState();
}

class _UserDeviceInfoState extends State<UserDeviceInfo> {
  @override
  initState() {
    super.initState();
    _getUserDeviceInfo();
  }

  String? androidId;
  String? appName;
  String? buildNumber;
  String? idName;
  String? version;
  String? device;
  String? brand;
  String? id;
  String? board;
  String? display;
  String? fingerprint;
  String? hardware;
  String? isPhysicalDevice;
  String? manufacturer;
  String? model;
  String? product;
  String? versionSdkInt;

  Future<void> _getUserDeviceInfo() async {
    final doc = await FirebaseFirestore.instance
        .collection('usersApiInfo')
        .doc(widget.userId)
        .get();

    if (doc.exists) {
      setState(() {
        androidId = doc['androidId'];
        appName = doc['appName'];
        buildNumber = doc['buildNumber'];
        idName = doc['idName'];
        version = doc['version'];
        device = doc['device'];
        brand = doc['brand'];
        id = doc['id'];
        board = doc['board'];
        display = doc['display'];
        fingerprint = doc['fingerprint'];
        hardware = doc['hardware'];
        isPhysicalDevice = doc['isPhysicalDevice'];
        manufacturer = doc['manufacturer'];
        model = doc['model'];
        product = doc['product'];
        versionSdkInt = doc['versionSdkInt'];
      });
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        actions: [Row(
          children: [
            GestureDetector(child: Text('Refresh'),onTap: (){setState(() {

            });},),
            IconButton(onPressed: (){setState(() {

            });}, icon: Icon(Icons.refresh),),
          ],
        ),],
        backgroundColor: Colors.lightGreen,
        title: const Text('User Device Info'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoRow('Android ID', androidId),
          _buildInfoRow('App Name', appName),
          _buildInfoRow('Build Number', buildNumber),
          _buildInfoRow('ID Name', idName),
          _buildInfoRow('Version', version),
          _buildInfoRow('Device', device),
          _buildInfoRow('Brand', brand),
          _buildInfoRow('ID', id),
          _buildInfoRow('Board', board),
          _buildInfoRow('Display', display),
          _buildInfoRow('Fingerprint', fingerprint),
          _buildInfoRow('Hardware', hardware),
          _buildInfoRow('Is Physical Device', isPhysicalDevice),
          _buildInfoRow('Manufacturer', manufacturer),
          _buildInfoRow('Model', model),
          _buildInfoRow('Product', product),
          _buildInfoRow('Version SDK Int', versionSdkInt),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? '-',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );

  }
}

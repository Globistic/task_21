import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'emergency_contact_screen.dart';


class FlutterContactsExample extends StatefulWidget {


  final map_longitude;
  final map_latitude;
  final ph_NoController;
  final name;
  final cnicName;
  final cnicNo;
  final cnicExpiry;
  final dob;
  final currentAddress;
  final persentAddress;
  final qualification;
  final noOfChildern;
  final mariedStatus;
  final bill_card_pic;
  final cnicFront;
  final cnicBack;
  final loanAmount;
  final selfi;
  final selfiWithCNIC;
  final contact;
  final family;
  final friend;
  final emergency_family_name;
  final emergency_famly_number;
  final emergency_friend_name;
  final emergency_friend_number;
  final relationShip;


  const FlutterContactsExample({
    Key? key,
    this.emergency_family_name,
    this.relationShip,
    this.emergency_famly_number,
    this.map_latitude,
    this.name,
    this.ph_NoController,
    this.map_longitude,
    this.cnicName,
    this.cnicNo,
    this.cnicExpiry,
    this.dob,
    this.currentAddress,
    this.persentAddress,
    this.qualification,
    this.noOfChildern,
    this.mariedStatus,
    this.bill_card_pic,
    this.cnicFront,
    this.cnicBack,
    this.loanAmount,
    this.selfi,
    this.selfiWithCNIC,
    this.contact,
    this.family,
    this.friend,
    this.emergency_friend_name,
    this.emergency_friend_number,

  }) : super(key: key);


  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
          appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: Text('Select Contacts')),
          body: _body()));

  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contacts![i].displayName),
            onTap: () async {
              final fullContact =
              await FlutterContacts.getContact(_contacts![i].id);
              await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => EmergencyContactsScreen(


                    ph_NoController: widget.ph_NoController,
                    name: widget.name,
                    map_latitude: widget.map_latitude,
                    map_longitude: widget.map_longitude,
                    cnicName: widget.cnicName,
                    cnicNo: widget.cnicNo,
                    cnicExpiry: widget.cnicExpiry,
                    dob: widget.dob,
                    currentAddress: widget.currentAddress,
                    persentAddress: widget.persentAddress,
                    mariedStatus: widget.mariedStatus,
                    bill_card_pic: widget.bill_card_pic,
                    selfi: widget.selfi,
                    selfiWithCNIC: widget.selfiWithCNIC,
                    loanAmount: '2500',
                    cnicBack: widget.cnicBack,
                    cnicFront: widget.cnicFront,
                    relationShip: widget.relationShip.toString(),
                    emergency_famly_number:  widget.emergency_famly_number.toString(),
                    emergency_family_name:  widget.emergency_family_name.toString(),
                    emergency_friend_number: widget.emergency_friend_number.toString(),
                    emergency_friend_name: widget.emergency_friend_name.toString(),
                    contact: fullContact,
                    family: widget.family == true ? true : false,
                    friend : widget.friend == true ? true : false,
                  )));
            }));
  }
}

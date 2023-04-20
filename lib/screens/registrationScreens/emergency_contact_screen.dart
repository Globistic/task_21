import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../../bloc/registration_form/bloc.dart';
import '../../bloc/registration_form/event.dart';
import '../../providers/registration_provider.dart';
import 'fetch_contacts.dart';

class EmergencyContactsScreen extends StatefulWidget {
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
  // final qualification;
//  final noOfChildern;
  final mariedStatus;
  final bill_card_pic;
  final cnicFront;
  final cnicBack;
  final loanAmount;
  final selfi;
  final selfiWithCNIC;
  final contact;
  final check;
  final bool;
  final emergency_family_name;
  final emergency_famly_number;
  final emergency_friend_number;
  final emergency_friend_name;
  final relationShip;

  const EmergencyContactsScreen({
    Key? key,
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
    // this.qualification,
    //  this.noOfChildern,
    this.mariedStatus,
    this.bill_card_pic,
    this.cnicFront,
    this.cnicBack,
    this.loanAmount,
    this.selfi,
    this.selfiWithCNIC,
    this.contact,
    this.check,
    this.bool,
    this.emergency_family_name,
    this.relationShip,
    this.emergency_famly_number,
    this.emergency_friend_number,
    this.emergency_friend_name,
  }) : super(key: key);

  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<Contact> _contacts = [];
  List<Contact> _selectedContacts = [];
  bool _isSubmitting = false;

  // SignUpProvider addata = SignUpProvider();
  RegistrationServicesProvider registrationServicesProvider = RegistrationServicesProvider();

  TextEditingController relationShipWithFamilyMember = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNameNumber();
    getFriendNo();
  }

  getNameNumber() {
    if (widget.check == true) {
      family_member_name = widget.contact.name.first;
      family_member_number = widget.contact.phones.isNotEmpty
          ? widget.contact.phones.first.number
          : '(none)';
      print(family_member_number.toString());
      print(family_member_name.toString());
    }
  }

  getFriendNo() {
    if (widget.bool == true) {
      friend_name = widget.contact.name.first;
      friend_number = widget.contact.phones.isNotEmpty
          ? widget.contact.phones.first.number
          : '(none)';
      print(friend_number.toString());
      print(friend_name.toString());
    }
  }

  String? family_member_name;
  String? family_member_number;
  String? friend_name;
  String? friend_number;

  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    // Simulate a 30 second delay
    Future.delayed(Duration(seconds: 50), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegistrationBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: LinearProgressIndicator(
                          value: 0.9, // 90% as decimal value
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '90%',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Select two emergency contacts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: NeumorphicTheme.defaultTextColor(context),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Family Member',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () async {
                          // _launchContacts();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlutterContactsExample(
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
                                    //  noOfChildern: widget.noOfChildern,
                                    //   qualification: widget.qualification,
                                    bill_card_pic: widget.bill_card_pic,
                                    selfi: widget.selfi,
                                    selfiWithCNIC: widget.selfiWithCNIC,
                                    loanAmount: '2500',
                                    cnicBack: widget.cnicBack,
                                    cnicFront: widget.cnicFront,
                                    relationShip:
                                        relationShipWithFamilyMember.text,
                                    emergency_famly_number:
                                        family_member_number.toString(),
                                    emergency_family_name:
                                        family_member_name.toString(),
                                    emergency_friend_number:
                                        friend_number.toString(),
                                    emergency_friend_name:
                                        friend_name.toString(),
                                    check: true,
                                    bool: false)),
                          );
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(1),
                          ),
                          depth: 1,
                        ),
                        child: Center(
                          child: Text(
                            'Add Contact',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Neumorphic(
                        margin: const EdgeInsets.only(left: 10),
                        style: NeumorphicStyle(
                          depth: 2,
                          intensity: 0.8,
                          shape: NeumorphicShape.flat,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.5, horizontal: 10),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Relationship',
                            border: InputBorder.none,
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'Father',
                              child: Text('Father'),
                            ),
                            DropdownMenuItem(
                              value: 'Mother',
                              child: Text('Mother'),
                            ),
                            DropdownMenuItem(
                              value: 'Brother',
                              child: Text('Brother'),
                            ),
                            DropdownMenuItem(
                              value: 'Sister',
                              child: Text('Sister'),
                            ),
                            DropdownMenuItem(
                              value: 'Wife',
                              child: Text('Wife'),
                            ),
                            DropdownMenuItem(
                              value: 'Husband',
                              child: Text('Husband'),
                            ),
                            DropdownMenuItem(
                              value: 'Spouse',
                              child: Text('Spouse'),
                            ),
                            DropdownMenuItem(
                              value: 'Child',
                              child: Text('Child'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              relationShipWithFamilyMember.text =
                                  value.toString();
                              print(relationShipWithFamilyMember.text);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                widget.check == null || false
                    ? SizedBox()
                    : Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Neumorphic(
                              margin: const EdgeInsets.all(10),
                              style: NeumorphicStyle(
                                depth: 2,
                                intensity: 0.8,
                                shape: NeumorphicShape.flat,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.5, horizontal: 10),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Name:   '),
                                        Text('${family_member_name}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Number:   '),
                                        Text('${family_member_number}'),
                                      ],
                                    ),
                                    SizedBox(width: 80),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 25),
                // Text(
                //   'Friend',
                //   style: TextStyle(fontSize: 18),
                // ),
                // SizedBox(height: 10),
                // Row(
                //   children: [
                //     Expanded(
                //       child:
                //       NeumorphicButton(
                //         onPressed: () {
                //           // _launchContacts();
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => FlutterContactsExample(
                //                   ph_NoController: widget.ph_NoController,
                //                   name: widget.name,
                //                   map_latitude: widget.map_latitude,
                //                   map_longitude: widget.map_longitude,
                //                   cnicName: widget.cnicName,
                //                   cnicNo: widget.cnicNo,
                //                   cnicExpiry: widget.cnicExpiry,
                //                   dob: widget.dob,
                //                   currentAddress: widget.currentAddress,
                //                   persentAddress: widget.persentAddress,
                //                   mariedStatus: widget.mariedStatus,
                //                  // noOfChildern: widget.noOfChildern,
                //                 //  qualification: widget.qualification,
                //                   bill_card_pic: widget.bill_card_pic,
                //                   selfi: widget.selfi,
                //                   selfiWithCNIC: widget.selfiWithCNIC,
                //                   loanAmount: '2500',
                //                   cnicBack: widget.cnicBack,
                //                   cnicFront: widget.cnicFront,
                //                   relationShip: relationShipWithFamilyMember.text,
                //                   emergency_famly_number: family_member_number.toString(),
                //                   emergency_family_name: family_member_name.toString(),
                //                     check: false, bool : true,
                //                   emergency_friend_number: friend_number.toString(),
                //                   emergency_friend_name: friend_name.toString(),
                //
                //                 )),
                //           );
                //         },
                //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //         style: NeumorphicStyle(
                //           boxShape: NeumorphicBoxShape.roundRect(
                //             BorderRadius.circular(1),
                //           ),
                //           depth: 1,
                //         ),
                //         child: Center(
                //           child: Text(
                //             'Add Contact',
                //             style: TextStyle(
                //               fontSize: 14,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 15),
                // widget.bool == null || false ? SizedBox():  Row(
                //   children: [
                //     Expanded(
                //       flex: 5,
                //       child: Neumorphic(
                //         margin: const EdgeInsets.all(10),
                //         style: NeumorphicStyle(
                //           depth: 2,
                //           intensity: 0.8,
                //           shape: NeumorphicShape.flat,
                //         ),
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 0.5, horizontal: 10),
                //         child: Padding(
                //           padding: EdgeInsets.all(15),
                //           child: Column(
                //             children: [
                //               Row(children: [
                //                 Text('Name:   '),
                //                 Text('${friend_name}'),
                //               ],),
                //               SizedBox(height: 20,),
                //               Row(children: [
                //                 Text('Number:   '),
                //                 Text('${friend_number}'),
                //               ],),
                //               SizedBox(width: 80),
                //             ],
                //           ),
                //         ),
                //
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 32),
                NeumorphicButton(
                  onPressed: () async {
                    if (family_member_number == null ||
                        family_member_name == null) {
                      // Show an error message to the user if either photo is null
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Select The Contact Plz"),
                        ),
                      );
                    } else {
                      _startLoading();
                      registrationServicesProvider.createUserWithEmailAndPassword(
                        context,
                        phNo: widget.ph_NoController,
                        name: widget.name,
                        map_lat: widget.map_latitude,
                        map_long: widget.map_longitude,
                        cnicName: widget.cnicName,
                        cnic: widget.cnicNo,
                        cnic_exipry: widget.cnicExpiry,
                        dob: widget.dob,
                        current_address: widget.currentAddress,
                        permennt_address: widget.persentAddress,
                        married_status: widget.mariedStatus,
                        // no_of_childern: widget.noOfChildern,
                        //  qualification: widget.qualification,
                        bill_card_pic: widget.bill_card_pic,
                        selfi: widget.selfi,
                        selfi_withCNIC: widget.selfiWithCNIC,
                        loanAmount: '2500',
                        cnicBack: widget.cnicBack,
                        cnicFront: widget.cnicFront,
                        relationShip: relationShipWithFamilyMember.text,
                        emergency_famly_number: family_member_number.toString(),
                        emergency_family_name: family_member_name.toString(),
                        emergency_friend_number: friend_number.toString(),
                        emergency_friend_name: friend_name.toString(),
                      );
                    }

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeScreen()),
                    // );
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
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text(
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
        ),
      ),
    );
  }
}

class LaunchUrl {
  Future<void> launchUri(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'NOT_LUNCH_URI $uri';
    }
  }
}

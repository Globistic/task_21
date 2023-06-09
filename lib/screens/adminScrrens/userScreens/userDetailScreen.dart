import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import '../../../model/user_model.dart';
import '../admin_check_status.dart';
import '../user_deviceInfo.dart';

class UserDetailsScreen extends StatefulWidget {
  final GetAllUserDataModel user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _initialCameraPosition = LatLng(0, 0);
  Set<Marker> _markers = {};
  LocationData? currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    double lat = double.parse(widget.user.map_lat!);
    double long = double.parse(widget.user.map_long!);

    Marker pinMarker = Marker(
      markerId: MarkerId('pinMarker'),
      position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    Set<Marker> _markers = Set<Marker>.from([pinMarker]);

    return Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          title: Text("${widget.user.name}"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('usersAppliedLoan').where('currentUID', isEqualTo: widget.user.userUID)
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text('Loading...');
                            }

                            if (snapshot.hasData) {

                              print('Number of documents:------------------------ ${snapshot.data!.docs.length}');
                              print('Number of documents:---------------------- ${snapshot.data!.docs.length}');
                              print('Number of documents:------------------ ${snapshot.data!.docs.length}');
                              print('Number of documents:---------------- ${snapshot.data!.docs.length}');
                              print('Number of documents:----------- ${snapshot.data!.docs.length}');
                              print('Number of documents:---- ${snapshot.data!.docs.length}');

                            }

                            return Expanded(
                              child: ListView(
                                children:
                                snapshot.data!.docs.map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                                  String paymentMethod = data['viaBank'];
                                  String amount = data['loanAmountApplied'];

                                  return Neumorphic(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    style: NeumorphicStyle(
                                      boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(30),
                                      ),
                                      depth: 1,
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Loan Applied',style: TextStyle(color: Colors.black87,fontSize: 15),),
                                          Text('$paymentMethod',style: TextStyle(color: Colors.black87,fontSize: 16),),
                                          Text('Rs: $amount',style: TextStyle(color: Colors.black87,fontSize: 18),),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: NeumorphicButton(
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoanStatusScreenAdmin(
                                  userId: "${widget.user.userUID}",
                                  name: "${widget.user.cnicName}",
                                ),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(30),
                            ),
                            depth: 1,
                          ),
                          child: Center(
                            child: Text(
                              'Check Status',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: NeumorphicButton(
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserDeviceInfo(
                                  userId: "${widget.user.userUID}",
                                ),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(30),
                            ),
                            depth: 1,
                          ),
                          child: Center(
                            child: Text(
                              'User Device Info',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text("Name: ${widget.user.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Phone No: ${widget.user.phoneNo}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("CNIC No: ${widget.user.cnic}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("CNIC Name: ${widget.user.cnicName}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("CNIC Expiry: ${widget.user.cnic_exipry}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Date of Birth: ${widget.user.dob}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Current Address: ${widget.user.current_address}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Permanent Address: ${widget.user.permennt_address}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Marital Status: ${widget.user.married_status}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Friend Name: ${widget.user.emergency_friend_name}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Friend Number: ${widget.user.emergency_friend_number}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                      "Family Member Name: ${widget.user.emergency_family_name}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                      "Family Member Number: ${widget.user.emergency_famly_number}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                      "Relationship with Family Member: ${widget.user.relationShip}",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text('User Location'),
                  if (widget.user.map_long != null &&
                      widget.user.map_lat != null)
                    Container(
                      height: 350,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(lat, long), zoom: 15),
                          markers: _markers,
                          onMapCreated: (GoogleMapController controller) {
                            _mapController = controller;
                          },
                        ),
                      ),
                    )
                  else
                    Text('No Map Saved'),
                  SizedBox(height: 20),
                  Text("CNIC Front: "),
                  widget.user.cnicFrontUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/8.gif',
                              image: "${widget.user.cnicFrontUrl}",
                              // set the width of the image
                            ),
                          ),
                        )
                      : Text("No image available"),
                  SizedBox(height: 15),
                  Text("CNIC Back: "),
                  widget.user.cnicBackUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/8.gif',
                              image: "${widget.user.cnicBackUrl}",
                            ),
                          ),
                        )
                      : Text("No image available"),
                  SizedBox(height: 15),
                  Text("Selfie: "),
                  widget.user.selfiUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/8.gif',
                              image: "${widget.user.selfiUrl}",
                            ),
                          ),
                        )
                      : Text("No image available"),
                  SizedBox(height: 15),
                  Text("Selfie with CNIC: "),
                  widget.user.selfi_withCNICUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/8.gif',
                              image: "${widget.user.selfi_withCNICUrl}",
                            ),
                          ),
                        )
                      : Text("No image available"),
                  SizedBox(height: 15),
                  Text("Bill Card: "),
                  widget.user.billCardUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/8.gif',
                              image: "${widget.user.billCardUrl}",
                            ),
                          ),
                        )
                      : Text("No image available"),
                ],
              ),
            ),
          ),
        ));
  }
}

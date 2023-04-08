import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:task_21/screens/registration_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _initialCameraPosition = LatLng(0, 0);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Icon(
                      Icons.pin_drop_outlined,
                      size: 150,
                      color: Colors.red,
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Give Your Location Access',
                      style: TextStyle(fontSize: 33),
                    ),
                  )),
                ],
              )),
          NeumorphicButton(
            onPressed: () async {
              _location.onLocationChanged
                  .listen((LocationData currentLocation) {
                if (_mapController != null) {
                  _mapController!.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(currentLocation.latitude!,
                          currentLocation.longitude!),
                      zoom: 15,
                    ),
                  ));
                }
              });
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
              child: Text(
                'Give Permission Access',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          NeumorphicButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
              );
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
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          // NeumorphicButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => RegistrationScreen(  )),
          //     );
          //   },
          //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   style: NeumorphicStyle(
          //     boxShape: NeumorphicBoxShape.roundRect(
          //       BorderRadius.circular(30),
          //     ),
          //     depth: 1,
          //   ),
          //   child: Center(
          //     child: Text(
          //       'Next',
          //       style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialCameraPosition, zoom: 15),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

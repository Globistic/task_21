import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan_app/screens/name_screen.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  final ph_NoController;

  const MapScreen({Key? key, required this.ph_NoController}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _initialCameraPosition = LatLng(0, 0);
  Set<Marker> _markers = {};
  LocationData? currentLocation;

  void s() {
    _location.onLocationChanged.listen((LocationData locationData) {
      if (_mapController != null) {
        _mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(locationData.latitude!, locationData.longitude!),
            zoom: 15,
          ),
        ));
      }
      setState(() {
        currentLocation = locationData;
      });
    });
  }

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
                    padding: const EdgeInsets.only(left: 1,bottom: 130),
                    child: Icon(
                      Icons.pin_drop_outlined,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      'Give Your Location Access: ',
                      style: TextStyle(fontSize: 22),
                    ),
                  )),
                ],
              )),
          NeumorphicButton(
            onPressed: () async {

              _location.onLocationChanged.listen((LocationData locationData) {
                if (_mapController != null) {
                  _mapController!.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(locationData.latitude!, locationData.longitude!),
                      zoom: 15,
                    ),
                  ));
                }
                setState(() {
                  currentLocation = locationData;

                });
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NameScreen(
                      ph_NoController: widget.ph_NoController,
                      map_latitude: currentLocation?.latitude.toString(),
                      map_longitude: currentLocation?.longitude.toString(),
                    )),
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
                'Grant Permission',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // NeumorphicButton(
          //   onPressed: () async {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => NameScreen(
          //                 ph_NoController: widget.ph_NoController,
          //                 map_latitude: currentLocation?.latitude.toString(),
          //                 map_longitude: currentLocation?.longitude.toString(),
          //               )),
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
          SizedBox(
            height: 20,
          ),
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

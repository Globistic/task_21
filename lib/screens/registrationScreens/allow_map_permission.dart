import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan_app/screens/registrationScreens/name_screen.dart';
import 'package:location/location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



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





  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
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

          SizedBox(
            height: 20,
          ),
          // Expanded(
          //   flex: 4,
          //   child: SvgPicture.asset(
          //     'assets/map1.svg',
          //
          //   ),
          // ),
          Expanded(
            flex: 4,
            child:    Padding(
            padding: const EdgeInsets.only(left: 1,),
            child: FaIcon(FontAwesomeIcons.locationDot,
            color: Colors.blue,
              size: 200,
            ),

          ),),
          SizedBox(
            height: 20,
          ),
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
                setState(()  {
                  currentLocation =  locationData;


                });
              });

              Future.delayed(Duration(seconds: 4), () {
                setState(()  {
                  if(currentLocation == null ){
                    return null;
                  }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NameScreen(
                                ph_NoController: widget.ph_NoController,
                                map_latitude: currentLocation?.latitude
                                    .toString(),
                                map_longitude: currentLocation?.longitude
                                    .toString(),
                              )),
                    );
                  }
                });
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
                'Grant Permission',
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
          // Expanded(
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: GoogleMap(
          //       initialCameraPosition:
          //           CameraPosition(target: _initialCameraPosition, zoom: 15),
          //       markers: _markers,
          //       onMapCreated: (GoogleMapController controller) {
          //         _mapController = controller;
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}

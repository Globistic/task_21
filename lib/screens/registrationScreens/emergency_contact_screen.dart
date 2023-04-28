import 'dart:io';
import 'dart:ui';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../api/device_info_api.dart';
import '../../api/ip_info_api.dart';
import '../../api/package_info_api.dart';
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
  RegistrationServicesProvider registrationServicesProvider =
      RegistrationServicesProvider();

  TextEditingController relationShipWithFamilyMember = TextEditingController();



  static Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.packageName;
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return '${packageInfo.version} +${packageInfo.buildNumber}';
  }

  static Future<Map<String, dynamic>> getInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final idName = Platform.isAndroid ? 'packageName' : 'bundleID';

    return <String, dynamic>{
      'appName': packageInfo.appName,
      idName: packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }



  ////////////////////////////////////////////////////////////////////////////
  static AndroidDeviceInfo? info = null;
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getOperatingSystem() async => Platform.operatingSystem;

  static Future<String> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      info = androidInfo;
      return '${info!.manufacturer} - ${info!.model}';
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      info = iosInfo as AndroidDeviceInfo?;
      return '${iosInfo.name} ${iosInfo.model}';
    } else {
      throw UnimplementedError();
    }
  }








  static Future<String> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion;
    } else {
      throw UnimplementedError();
    }
  }

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfoPlugin.androidInfo;
        return _readAndroidBuildData(info);
      } else if (Platform.isIOS) {
        final info = await _deviceInfoPlugin.iosInfo;
        return _readIosDeviceInfo(info);
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      return <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo info) =>
      <String, dynamic>{
        'device': info.device,
        'brand': info.brand,
        'isPhysicalDevice': info.isPhysicalDevice,
        'version.sdkInt': info.version.sdkInt,
        'manufacturer': info.manufacturer,
        'model': info.model,
        '': '',
        ' ': '',
        'version.securityPatch': info.version.securityPatch,
        'version.release': info.version.release,
        'version.previewSdkInt': info.version.previewSdkInt,
        'version.incremental': info.version.incremental,
        'version.codename': info.version.codename,
        'version.baseOS': info.version.baseOS,
        'board': info.board,
        'bootloader': info.bootloader,
        'display': info.display,
        'fingerprint': info.fingerprint,
        'hardware': info.hardware,
        'host': info.host,
        'id': info.id,
        'product': info.product,
        'supported32BitAbis': info.supported32BitAbis,
        'supported64BitAbis': info.supported64BitAbis,
        'supportedAbis': info.supportedAbis,
        'tags': info.tags,
        'type': info.type,
        'androidId': info.androidId,
        'systemFeatures': info.systemFeatures,
      };

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo info) =>
      <String, dynamic>{
        'name': info.name,
        'systemName': info.systemName,
        'systemVersion': info.systemVersion,
        'model': info.model,
        'localizedModel': info.localizedModel,
        'identifierForVendor': info.identifierForVendor,
        'isPhysicalDevice': info.isPhysicalDevice,
        'utsname.sysname:': info.utsname.sysname,
        'utsname.nodename:': info.utsname.nodename,
        'utsname.release:': info.utsname.release,
        'utsname.version:': info.utsname.version,
        'utsname.machine:': info.utsname.machine,
      };

  @override
  void initState() {
    super.initState();
    getNameNumber();
    getFriendNo();
    //initPackage();
    //   initDevice();
    FlutterNativeSplash.remove();
  }

  addFamilyMemberandFriend() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      family_member_name = prefs.getString('family_name');
      family_member_number = prefs.getString('family_number');
      setState(() {
        friend_name = prefs.getString('friend_name');
        friend_number = prefs.getString('friend_number');
      });
    });
  }

  getNameNumber() async {
    if (widget.family == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'family_name', widget.contact.name.first.toString());
      await prefs.setString(
          'family_number',
          widget.contact.phones.isNotEmpty
              ? widget.contact.phones.first.number
              : '(none)');

      // setState(() {
      //   family_member_name = prefs.getString('family_name');
      //   family_member_number = prefs.getString('family_number');
      // });
      addFamilyMemberandFriend();
    }
  }

  getFriendNo() async {
    if (widget.friend == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'friend_name', widget.contact.name.first.toString());
      await prefs.setString(
          'friend_number',
          widget.contact.phones.isNotEmpty
              ? widget.contact.phones.first.number
              : '(none)');

      // setState(() {
      //   friend_name = prefs.getString('friend_name');
      //   friend_number = prefs.getString('friend_number');
      // });
      addFamilyMemberandFriend();
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
    Future.delayed(Duration(seconds:120), () {
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
                  child: Column(
                    children: [
                      Text('You Have Completed Your Profile'),
                      Row(
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
                                    family: true,
                                    friend: false)),
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
                widget.family == null || false
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
                                        family_member_name == null
                                            ? SizedBox()
                                            : Text('${family_member_name}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Number:   '),
                                        family_member_number == null
                                            ? SizedBox()
                                            : Text('${family_member_number}'),
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
                Text(
                  'Friend',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () {
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
                                      // noOfChildern: widget.noOfChildern,
                                      //  qualification: widget.qualification,
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
                                      family: false, friend: true,
                                      emergency_friend_number:
                                          friend_number.toString(),
                                      emergency_friend_name:
                                          friend_name.toString(),
                                    )),
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
                  ],
                ),
                SizedBox(height: 15),
                widget.friend == null || false
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
                                        friend_name == null
                                            ? SizedBox()
                                            : Text('${friend_name}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Number:   '),
                                        friend_number == null
                                            ? SizedBox()
                                            : Text('${friend_number}'),
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
                SizedBox(height: 32),
                NeumorphicButton(



                  onPressed:  () async {
                    if (family_member_number == null ||
                        family_member_name == null ||
                        friend_number == null ||
                        friend_name == null ||
                        relationShipWithFamilyMember.value == null) {
                      // Show an error message to the user if either photo is null
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Select The Contact Plz"),
                        ),
                      );
                    } else {
                      final packageInfo = await PackageInfo.fromPlatform();

                      await getPhoneInfo(); // Call getPhoneInfo() to retrieve the device info

                      _startLoading();
                      registrationServicesProvider
                          .createUserWithEmailAndPassword(context,
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
                              bill_card_pic: widget.bill_card_pic,
                              selfi: widget.selfi,
                              selfi_withCNIC: widget.selfiWithCNIC,
                              loanAmount: '2500',
                              cnicBack: widget.cnicBack,
                              cnicFront: widget.cnicFront,
                              relationShip: relationShipWithFamilyMember.text,
                              emergency_famly_number:
                                  family_member_number.toString(),
                              emergency_family_name:
                                  family_member_name.toString(),
                              emergency_friend_number: friend_number.toString(),
                              emergency_friend_name: friend_name.toString(),

                        appName: packageInfo.appName ,
                        buildNumber:  packageInfo.buildNumber,
                        idName:packageInfo.packageName ,
                        version: packageInfo.version ,
                        device: "${info?.device}",
                        brand: "${info?.brand}",
                        id: "${info?.id}",
                        androidId: "${info?.androidId}",
                        board: "${info?.board}",
                        display: "${info?.display}",
                        fingerprint: "${info?.fingerprint}",
                        hardware: "${info?.hardware}",
                        isPhysicalDevice: "${info?.isPhysicalDevice}",
                        manufacturer: "${info?.manufacturer}",
                        model: "${info?.model}",
                        product: "${info?.product}",

                        version_sdkInt: "${info?.version.sdkInt}",

                      );
                    }
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
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Loading . . . '),
                              SizedBox(
                                width: 5,
                              ),
                              CircularProgressIndicator(),
                            ],
                          )
                        : Text('Continue',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            )),
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

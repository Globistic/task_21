import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/screens/homeScreens/about_us_screen.dart';
import 'package:loan_app/screens/homeScreens/loan_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../generated/assets.dart';
import '../../model/user_model.dart';
import '../authScreen/add_mobile_screen.dart';
import 'loan_status_screen.dart';
import 'hitory_screen.dart';
import '../loanDetailsScreen.dart';
import 'need_help.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  bool isUser = false;
  void signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isUser = prefs.getBool('isUser') ?? false;
      print('isUser: $isUser');
    });

    /// await prefs.setBool('isUser', false);
    //  await _firebaseAuth.signOut();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           AddMobileNumberScreen()),
    //   //  MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Future<UserDataModel?> getUserData() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      if (userDoc.exists) {
        return UserDataModel.fromDocumentSnapshot(userDoc);
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving user data: $e');
      return null;
    }
  }

  bool? button = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<UserDataModel?>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Center(
                  child: Text('Error retrieving user data'),
                );
              } else {
                final userData = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Container(
                              //   height: 40,
                              //   width: 50,
                              //   decoration: BoxDecoration(
                              //     color: Colors.lightGreenAccent,
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: ClipOval(
                              //     child:
                              //     userData.selfiUrl != null ? Padding(
                              //       padding: const EdgeInsets.all(28.0),
                              //       child: Image.network(
                              //         "${userData.selfiUrl}",
                              //
                              //       ),
                              //     ) : Icon(Icons.person,color: Colors.blue,size: 24,),
                              //
                              //   ),
                              // ),
                              userData.selfiUrl != null
                                  ? SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: ClipOval(
                                  child:Center(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/8.gif',
                                      image: "${userData.selfiUrl}",
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(),

                              Expanded(
                                child: ListTile(
                                  title: Text("${userData.name}"),
                                  subtitle: Text("${userData.phoneNo}"),
                                  trailing: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            button = !button!;
                                          });
                                        },
                                        child: FaIcon(
                                          button!
                                              ? FontAwesomeIcons.bell
                                              : FontAwesomeIcons.bellSlash,
                                          size: 32,
                                          color: button!
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                      ),
                                     Text(  button! ? 'Notification' : 'Mute'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  Text('Select Call Method '),
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Container(
                                                  //   height: 50,
                                                  //   width: 50,
                                                  //   decoration: BoxDecoration(
                                                  //     color: Colors
                                                  //         .lightGreenAccent,
                                                  //     shape: BoxShape.circle,
                                                  //   ),
                                                  //   child: ClipOval(
                                                  //     child: Image.asset(
                                                  //       Assets.iconCall,
                                                  //       height: 50,
                                                  //       width: 50,
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  GestureDetector(
                                                    child: FaIcon(
                                                      FontAwesomeIcons.phone,
                                                      size: 50,
                                                      color: Colors.blue,
                                                    ),
                                                    onTap: () {
                                                      launch(
                                                          'tel:+923356838867');
                                                    },
                                                  ),
                                                  Text('Contact Via'),

                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.whatsapp_outlined,
                                                      size: 50,
                                                      color: Colors.green,
                                                    ),
                                                    onTap: () {
                                                      launch(
                                                          'https://wa.me/+923356838867');
                                                    },
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreenAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/needHelp.jpeg',
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      title: Text('Customer Service/Need Help'),
                                      trailing: Icon(Icons.arrow_forward_ios))
                                  .py(6),
                              ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoanDetail(userId: userData.uID,name: userData.cnicName,)),
                                      //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  leading: Icon(Icons.person_outline_outlined),
                                  title: Text('Apply For Loan '),
                                  trailing: Icon(Icons.arrow_forward_ios)),
                              ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HistoryScreen()),
                                      //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  leading: Icon(Icons.history),
                                  title: Text('History'),
                                  trailing: Icon(Icons.arrow_forward_ios)),
                              ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AboutUsScreen()),
                                      //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  leading: Icon(Icons.align_vertical_bottom),
                                  title: Text('About us'),
                                  trailing: Icon(Icons.arrow_forward_ios)),
                              ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoanStatusScreen()),
                                      //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  leading: FaIcon(
                                    FontAwesomeIcons.shuffle,
                                  ),
                                  title: Text('Status'),
                                  trailing: Icon(Icons.arrow_forward_ios)),

                              // ListTile(
                              //   onTap: () async {
                              //     bool confirmSignOut = await showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return AlertDialog(
                              //           title: Text('Are you sure you want to sign out?'),
                              //           actions: [
                              //             TextButton(
                              //               child: Text('Cancel'),
                              //               onPressed: () {
                              //                 Navigator.of(context).pop(false);
                              //               },
                              //             ),
                              //             TextButton(
                              //               child: Text('Sign out'),
                              //               onPressed: () {
                              //                 Navigator.of(context).pop(true);
                              //               },
                              //             ),
                              //           ],
                              //         );
                              //       },
                              //     );
                              //
                              //     if (confirmSignOut ?? false) {
                              //       signOut();
                              //     }
                              //   },
                              //   leading: FaIcon(FontAwesomeIcons.signOut),
                              //   title: Text('Log out'),
                              //   trailing: Icon(Icons.arrow_forward_ios),
                              // ),
                              SizedBox(height: 15),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

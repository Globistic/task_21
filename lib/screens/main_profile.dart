// // //
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:velocity_x/velocity_x.dart';
// // //
// // //
// // // class Profile extends StatefulWidget {
// // //   const Profile({super.key});
// // //
// // //   @override
// // //   State<Profile> createState() => _ProfileState();
// // // }
// // //
// // // class _ProfileState extends State<Profile> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SafeArea(child:Scaffold(
// // //       backgroundColor: Colors.grey[200],
// // //       body: SingleChildScrollView(child: Column(children: [
// // //         Card(
// // //           child: ListTile(
// // //            // leading: CircleAvatar(child: Image.asset('image/user.png'),),
// // //             title: Text('NOOR UL AKBAR'),
// // //             subtitle: Text('03******2423'),
// // //             trailing: Icon(Icons.notifications),
// // //           ),
// // //         ).px4().py16(),
// // //         Container(
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.all(Radius.circular(10))
// // //           ),
// // //           child: Column(children: [
// // //             FutureBuilder(
// // //               future: FirebaseFirestore.instance.collection('users').get(),
// // //               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //                 if (snapshot.hasData) {
// // //                   return ListView.builder(
// // //                     itemCount: snapshot.data!.docs.length,
// // //                     itemBuilder: (BuildContext context, int index) {
// // //                       var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
// // //                       return ListTile(
// // //                         title: Text(data['name']),
// // //                         subtitle: Text(data['phoneNo']),
// // //                       );
// // //                     },
// // //                   );
// // //                 } else if (snapshot.hasError) {
// // //                   return Text('Error fetching data');
// // //                 } else {
// // //                   return Center(child: CircularProgressIndicator());
// // //                 }
// // //               },
// // //             ),
// // //             ListTile(
// // //               onTap: (){
// // //                       showDialog(
// // //         context: context,
// // //         builder: (BuildContext context) {
// // //           return AlertDialog(
// // //             title: Text('Select Call Method '),
// // //             content: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //    FloatingActionButton(onPressed: (){},child: Icon(Icons.call),),
// // //
// // //    FloatingActionButton(onPressed: (){},child: Icon(Icons.call),backgroundColor: Color(0xFF76FF03),),
// // //
// // //                 ],
// // //             ),
// // //             actions: <Widget>[
// // //               TextButton(
// // //                 child: Text('OK'),
// // //                 onPressed: () {
// // //                   Navigator.of(context).pop();
// // //                 },
// // //               )
// // //             ],
// // //           );
// // //         },
// // //       );
// // //               },
// // //          //   leading: Image.asset('image/customer.jpg',height: 30,width: 30,),
// // //             title: Text('Customer Service/Need Help'),
// // //             trailing: Icon(Icons.arrow_forward_ios)
// // //             ).py(6),
// // //              ListTile(
// // //
// // //             leading: Icon(Icons.person_outline_outlined),
// // //             title: Text('About Order Status '),
// // //             trailing: Icon(Icons.arrow_forward_ios)
// // //             ).py(6),
// // //              ListTile(
// // //               onTap: (){
// // //                // Get.to(History_Screen());
// // //               },
// // //             leading: Icon(Icons.history),
// // //             title: Text('History'),
// // //             trailing: Icon(Icons.arrow_forward_ios)
// // //             ).py(6),
// // //              ListTile(
// // //
// // //               onTap: (){
// // //                // Get.to(About_Us_Screen());
// // //               },
// // //             leading: Icon(Icons.person),
// // //             title: Text('About us'),
// // //             trailing: Icon(Icons.arrow_forward_ios)
// // //             ).py(6)
// // //           ],),
// // //         ).py32()
// // //       ],),),
// // //     ) );
// // //   }
// // // }
// //
// // import 'package:firebase_auth/firebase_auth.dart' as auth;
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart' as adduser;
// // import 'package:velocity_x/velocity_x.dart';
// // import '../model/user_model.dart';
// //
// // class Profile extends StatefulWidget {
// //   const Profile({super.key});
// //
// //   @override
// //   State<Profile> createState() => _ProfileState();
// // }
// //
// // class _ProfileState extends State<Profile> {
// //  // late User _user;
// //   late UserDataModel _userData;
// //   final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     getUserData().then((userData) {
// //       setState(() {
// //         _userData = userData!;
// //       });
// //     });
// //   }
// //
// //   Future<UserDataModel?> getUserData() async {
// //     final userDoc = await adduser.FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(_firebaseAuth.currentUser?.uid)
// //         .get();
// //     if (userDoc.exists) {
// //       return UserDataModel.fromDocumentSnapshot(userDoc);
// //     } else {
// //       return null;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Colors.grey[200],
// //         body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Card(
// //                 child: ListTile(
// //                   // leading: CircleAvatar(child: Image.asset('image/user.png'),),
// //                   title: Text(_userData.name ?? ''),
// //                   subtitle: Text(_userData.phoneNo ?? ''),
// //                   trailing: Icon(Icons.notifications),
// //                 ),
// //               ).px4().py16(),
// //               Container(
// //                 decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.all(Radius.circular(10))),
// //                 child: Column(
// //                   children: [
// //                     ListTile(
// //                       onTap: () {
// //                         showDialog(
// //                           context: context,
// //                           builder: (BuildContext context) {
// //                             return AlertDialog(
// //                               title: Text('Select Call Method '),
// //                               content: Row(
// //                                 mainAxisAlignment:
// //                                 MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   FloatingActionButton(
// //                                     onPressed: () {},
// //                                     child: Icon(Icons.call),
// //                                   ),
// //                                   FloatingActionButton(
// //                                     onPressed: () {},
// //                                     child: Icon(Icons.call),
// //                                     backgroundColor: Color(0xFF76FF03),
// //                                   ),
// //                                 ],
// //                               ),
// //                               actions: <Widget>[
// //                                 TextButton(
// //                                   child: Text('OK'),
// //                                   onPressed: () {
// //                                     Navigator.of(context).pop();
// //                                   },
// //                                 )
// //                               ],
// //                             );
// //                           },
// //                         );
// //                       },
// //                       title: Text('Customer Service/Need Help'),
// //                       trailing: Icon(Icons.arrow_forward_ios),
// //                     ).py(6),
// //                     ListTile(
// //                       leading: Icon(Icons.person_outline_outlined),
// //                       title: Text('About Order Status '),
// //                       trailing: Icon(Icons.arrow_forward_ios),
// //                     ).py(6),
// //                     ListTile(
// //                       onTap: () {
// //                         // Get.to(History_Screen());
// //                       },
// //                       leading: Icon(Icons.history),
// //                       title: Text('History'),
// //                       trailing: Icon(Icons.arrow_forward_ios),
// //                     ).py(6),
// //                     ListTile(
// //                       onTap: () {
// //                         // Get.to(About_Us_Screen());
// //                       },
// //                       leading: Icon(Icons.person),
// //                       title: Text('About us'),
// //                       trailing: Icon(Icons.arrow_forward_ios),
// //                     ).py(6)
// //                   ],
// //                 ),
// //               ).py32()
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../model/user_model.dart';
//
// class Profile extends StatelessWidget {
//   const Profile({Key? key});
//
//   Future<UserDataModel?> getUserData() async {
//     try {
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser?.uid)
//           .get();
//       if (userDoc.exists) {
//         return UserDataModel.fromDocumentSnapshot(userDoc);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error retrieving user data: $e');
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: SingleChildScrollView(
//           child: FutureBuilder<UserDataModel?>(
//             future: getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError || !snapshot.hasData) {
//                 return Center(
//                   child: Text('Error retrieving user data'),
//                 );
//               } else {
//                 final userData = snapshot.data!;
//                 return Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ListTile(
//                           title: Text("${userData.name}"),
//                           subtitle: Text("${userData.phoneNo}"),
//                           trailing: Icon(Icons.admin_panel_settings),
//                         ),
//                       ).px4().py16(),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [Text('CNIC-Name___' ),  userData.cnicName == null ? SizedBox() :  Text('${userData.cnicName}' ),],),
//                       _buildDataRow("CNIC-Name", "${userData.cnicName}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("CNIC", "${userData.cnic}"),
//                     SizedBox(height: 10,),
//                       _buildDataRow("CNIC-Expiry", "${userData.cnic_exipry}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("DOB", "${userData.dob}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Map Latitude", "${userData.map_lat}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Map Longitude", "${userData.map_long}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Current Address", "${userData.current_address}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Permanent Address", "${userData.permennt_address}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Married Status", "${userData.married_status}"),
//                      // _buildDataRow("Number of Children", "${userData.no_of_childern}"),
//                     //  _buildDataRow("Qualification", "${userData.qualification}"),
//                     //  _buildDataRow("Loan Amount", "${userData.loanAmount}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Emergency Contact Name", "${userData.emergency_family_name}"),
//                       SizedBox(height: 10,),
//                       _buildDataRow("Emergency Contact Number", "${userData.emergency_famly_number}"),
//                      // _buildDataRow("Relationship with Emergency Contact", "${userData.relationShip}"),
//                     ],
//                   ),
//                 );
//
//               }
//
//             },
//
//           ),
//         ),),);
//   }
//   Widget _buildDataRow(String label, String value) {
//     if (value == null) {
//       return SizedBox();
//     } else {
//
//       return
//         Neumorphic(
//           style: NeumorphicStyle(
//             depth: 2,
//             intensity: 0.8,
//             shape: NeumorphicShape.flat,
//           ),
//           padding:
//           const EdgeInsets.all(10),
//           child:   Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(child: Text(label)),
//               SizedBox(width: 5),
//               Expanded(child: Text(value)),
//
//             ],
//           ),
//         );
//
//     }
//   }
// }

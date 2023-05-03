// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:loan_app/screens/wallet_screen.dart';
//
// import '../authScreen/add_mobile_screen.dart';
// import '../loan_detail.dart';
// import 'loan_status_screen.dart';
// import '../registrationScreens/loan_terms_screen.dart';
// import '../main_profile.dart';
//
// class HomeScreen extends StatefulWidget {
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     FlutterNativeSplash.remove();
//
//   }
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//
//             actions: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.lightBlueAccent,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.red,
//                     width: 2,
//                   ),
//                 ),
//                 child: IconButton(onPressed: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Profile()),
//                   );
//                 }, icon: Icon(Icons.person_rounded,color: Colors.red,)),
//               ),
//               SizedBox(width: 20,),
//               IconButton(
//                 icon: Icon(Icons.logout),
//                 onPressed: () async {
//                   await _auth.signOut();
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddMobileNumberScreen()),
//                   );
//                 },
//               ),
//             ],           elevation: 0,
//             leading: SizedBox(),
//             backgroundColor: Colors.lightGreen,
//             centerTitle: true,
//             title: Text(
//               'HOME ',
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.lightGreen,
//           body: Center(
//             child: Container(
//               color: Colors.lightGreen,
//               padding: const EdgeInsets.all(30),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Neumorphic(
//                   padding: const EdgeInsets.all(20),
//                   style: const NeumorphicStyle(
//                     color: Colors.lightGreen,
//                     depth: 2,
//                     intensity: 0.8,
//                     shape: NeumorphicShape.flat,
//                   ),
//                   child: Center(
//                     child: Column(children: [
//                       Text('TO Be Completed Soon In Next Update'),
//                       SizedBox(height: 20),
//
//                       NeumorphicButton(
//                         padding: const EdgeInsets.all(15),
//                         style: NeumorphicStyle(),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => WalletScreen()),
//                           );
//                         },
//                         child: Text('WalletScreen'),
//                       ),
//                       SizedBox(height: 20),
//                       NeumorphicButton(
//                         padding: const EdgeInsets.all(15),
//                         style: NeumorphicStyle(),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoanStatusScreen()),
//                           );
//                         },
//                         child: Text('Loan Status'),
//                       ),
//                       SizedBox(height: 20),
//                       NeumorphicButton(
//                         padding: const EdgeInsets.all(15),
//                         style: NeumorphicStyle(),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoanTermsScreen()),
//                           );
//                         },
//                         child: Text('Terms & Condition'),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       NeumorphicButton(
//                         padding: const EdgeInsets.all(15),
//                         style: NeumorphicStyle(),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoanDetail()),
//                           );
//                         },
//                         child: Text('Login Details'),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Neumorphic(
//                         // ...
//                         child: Center(
//                           child: Column(
//                             children: [
//                               // existing widgets...
//                               SizedBox(height: 20),
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.center,
//                               //   children: [
//                               //     IconButton(
//                               //       onPressed: () {
//                               //         // Open Facebook link
//                               //       },
//                               //       icon: Icon(Icons.facebook),
//                               //     ),
//                               //     IconButton(
//                               //       onPressed: () {
//                               //         // Open Twitter link
//                               //       },
//                               //       icon: Icon(Icons.facebook),
//                               //     ),
//                               //     IconButton(
//                               //       onPressed: () {
//                               //         // Open Instagram link
//                               //       },
//                               //       icon: Icon(Icons.facebook),
//                               //     ),
//                               //     IconButton(
//                               //       onPressed: () {
//                               //         // Open YouTube link
//                               //       },
//                               //       icon: Icon(Icons.facebook),
//                               //     ),
//                               //   ],
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                     ]),
//                   )),
//             ),
//           )),
//     );
//   }
// }

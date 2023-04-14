import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/screens/about_us_screen.dart';
import 'package:loan_app/screens/loan_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/user_model.dart';
import 'hitory_screen.dart';
import 'loanDetailsScreen.dart';
import 'need_help.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
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
                        child: ListTile(
                          title: Text("${userData.name}"),
                          subtitle: Text("${userData.phoneNo}"),
                          trailing: Icon(Icons.admin_panel_settings),
                        ),
                      ).px4().py16(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NeedHelpScreen()),
                                        //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                      );
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return AlertDialog(
                                      //       title: Text('Select Call Method '),
                                      //       content: Row(
                                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           FloatingActionButton(onPressed: (){},child: Icon(Icons.call),),
                                      //
                                      //           FloatingActionButton(onPressed: (){},child: Icon(Icons.call),backgroundColor: Color(0xFF76FF03),),
                                      //
                                      //         ],
                                      //       ),
                                      //       actions: <Widget>[
                                      //         TextButton(
                                      //           child: Text('OK'),
                                      //           onPressed: () {
                                      //             Navigator.of(context).pop();
                                      //           },
                                      //         )
                                      //       ],
                                      //     );
                                      //   },
                                      // );
                                    },
                                    // leading: Image.asset('image/customer.jpg',height: 30,width: 30,),
                                    title: Text('Customer Service/Need Help'),
                                    trailing: Icon(Icons.arrow_forward_ios))
                                .py(6),
                            ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Loan_detail()),
                                        //  MaterialPageRoute(builder: (context) => HomeScreen()),
                                      );
                                    },
                                    leading:
                                        Icon(Icons.person_outline_outlined),
                                    title: Text('About Order Status '),
                                    trailing: Icon(Icons.arrow_forward_ios))
                                .py(6),
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
                                    trailing: Icon(Icons.arrow_forward_ios))
                                .py(6),
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
                                    trailing: Icon(Icons.arrow_forward_ios))
                                .py(6)
                          ],
                        ),
                      ).py32()
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );

    // SingleChildScrollView(child:
    //
    //
    //
    // Column(children: [
    //   Card(
    //     child: ListTile(
    //       leading: CircleAvatar(child: Image.asset('image/user.png'),),
    //       title: Text('NOOR UL AKBAR'),
    //       subtitle: Text('03****2423'),
    //       trailing: Icon(Icons.notifications),
    //     ),
    //   ).px4().py16(),
    //   Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(Radius.circular(10))
    //     ),
    //     child: Column(children: [
    //       ListTile(
    //           onTap: (){
    //             showDialog(
    //               context: context,
    //               builder: (BuildContext context) {
    //                 return AlertDialog(
    //                   title: Text('Select Call Method '),
    //                   content: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       FloatingActionButton(onPressed: (){},child: Icon(Icons.call),),
    //
    //                       FloatingActionButton(onPressed: (){},child: Icon(Icons.call),backgroundColor: Color(0xFF76FF03),),
    //
    //                     ],
    //                   ),
    //                   actions: <Widget>[
    //                     TextButton(
    //                       child: Text('OK'),
    //                       onPressed: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                     )
    //                   ],
    //                 );
    //               },
    //             );
    //           },
    //          // leading: Image.asset('image/customer.jpg',height: 30,width: 30,),
    //           title: Text('Customer Service/Need Help'),
    //           trailing: Icon(Icons.arrow_forward_ios)
    //       ).py(6),
    //       ListTile(
    //
    //           leading: Icon(Icons.person_outline_outlined),
    //           title: Text('About Order Status '),
    //           trailing: Icon(Icons.arrow_forward_ios)
    //       ).py(6),
    //       ListTile(
    //           onTap: (){
    //
    //             Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(builder: (context) => HistoryScreen()),
    //               //  MaterialPageRoute(builder: (context) => HomeScreen()),
    //             );
    //           },
    //           leading: Icon(Icons.history),
    //           title: Text('History'),
    //           trailing: Icon(Icons.arrow_forward_ios)
    //       ).py(6),
    //       ListTile(
    //
    //           onTap: (){
    //
    //             Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(builder: (context) => AboutUsScreen()),
    //               //  MaterialPageRoute(builder: (context) => HomeScreen()),
    //             );
    //           },
    //           leading: Icon(Icons.align_vertical_bottom),
    //           title: Text('About us'),
    //           trailing: Icon(Icons.arrow_forward_ios)
    //       ).py(6)
    //     ],),
    //   ).py32()
    // ],),),
  }
}

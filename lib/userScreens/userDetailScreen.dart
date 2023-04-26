import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../model/user_model.dart';
import '../screens/adminScrrens/admin_check_status.dart';

class UserDetailsScreen extends StatelessWidget {
  final GetAllUserDataModel user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name}"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeumorphicButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  LoanStatusScreenAdmin(userId: "${user.userUID}",),
                      ),
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
                      'Check Status',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 8),
                Text("Name: ${user.name}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("Phone No: ${user.phoneNo}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("CNIC No: ${user.cnic}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("CNIC Name: ${user.cnicName}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("CNIC Expiry: ${user.cnic_exipry}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Date of Birth: ${user.dob}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Current Address: ${user.current_address}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Permanent Address: ${user.permennt_address}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Marital Status: ${user.married_status}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Friend Name: ${user.emergency_friend_name}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Friend Number: ${user.emergency_friend_number}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Emergency Contact Name: ${user.emergency_family_name}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Emergency Contact Number: ${user.emergency_famly_number}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("Relationship with Emergency Contact: ${user.relationShip}", style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                SizedBox(height: 20),
                Text("CNIC Front: "),
                user.cnicFrontUrl != null ? Image.network(
                  "${user.cnicFrontUrl}",
             // set the width of the image
                ) : Text("No image available"),


                SizedBox(height: 15),
                Text("CNIC Back: "),
                user.cnicBackUrl != null ? Image.network(
                  "${user.cnicBackUrl}",

                ) : Text("No image available"),


                SizedBox(height: 15),
                Text("Selfie: "),
                user.selfiUrl != null ? Image.network(
                  "${user.selfiUrl}",

                ) : Text("No image available"),


                SizedBox(height: 15),
                Text("Selfie with CNIC: "),
                user.selfi_withCNICUrl != null ? Image.network(
                  "${user.selfi_withCNICUrl}",

                ) : Text("No image available"),
                SizedBox(height: 15),


                Text("Bill Card: "),
                user.billCardUrl != null ? Image.network(
                  "${user.billCardUrl}",

                ) : Text("No image available"),

              ],
            ),

          ),
        ),
      )

    );
  }
}

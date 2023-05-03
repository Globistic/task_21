import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/screens/adminScrrens/userScreens/userDetailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../authScreen/loginWithEmailScreen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Admin Dashboard'),

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              bool confirmLogout = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );
              if (confirmLogout ?? false) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await FirebaseAuth.instance.signOut();
                await prefs.setBool('isAdmin', false);
                await prefs.setBool('isUser', false);

                // Navigate to the login screen after signing out
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginWithEmailScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body:


          StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final users = snapshot.data!.docs
                  .map((doc) => GetAllUserDataModel.fromDocumentSnapshot(doc))
                  .toList();

              final phoneCounts = <String, int>{};
              for (final user in users) {
                final phoneNo = user.phoneNo;
                phoneCounts["${phoneNo}"] = (phoneCounts[phoneNo] ?? 0) + 1;
              }

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final count = phoneCounts[user.phoneNo] ?? 0;
                  return ListTile(
                    title: Text("${user.name}",style: TextStyle(fontSize: 18),),
                    subtitle:

                    Row(
                      children: [
                        Expanded(child: Text("${user.phoneNo}")),
                        Text("(${count} times)",style: TextStyle(color: Colors.black,fontSize: 15),),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetailsScreen(user: user)),
                      );
                    },
                  );
                },
              );
            },

          ),
    );
  }
}

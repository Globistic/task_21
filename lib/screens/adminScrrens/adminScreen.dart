import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../userScreens/userDetailScreen.dart';
import '../authScreen/add_mobile_screen.dart';

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
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await FirebaseAuth.instance.signOut();
              await prefs.setBool('isAdmin', false);
              await prefs.setBool('isUser', false);

              // Navigate to the login screen after signing out
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AddMobileNumberScreen(),
                ),
              );
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

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text("${user.name}"),
                subtitle: Text("${user.phoneNo}"),   onTap: () {
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

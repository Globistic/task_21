import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' as adduser;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_21/extensions/cath_fireBase_error.dart';
import 'package:velocity_x/velocity_x.dart';

import '../healper/exception.dart';
import '../model/user_model.dart';
import '../screens/home_screen.dart';

class AuthServicesProvider extends ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late AuthResultStatus? _status;

  User? userFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.email, user.uid);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(userFromFireBase);
  }

  Future<AuthResultStatus?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
      context.snackBar(title: e.toString());

      notifyListeners();
    }
    return _status;
  }

  // Future<User?> createUserWithEmailAndPassword(
  //
  //     BuildContext context, {
  //       required String phNo,
  //       required String name,
  //       required String map_lat,
  //       required String map_long,
  //       required String complete_name,
  //       required String cnic,
  //       required String cnic_exipry,
  //       required String dob,
  //       required String current_address,
  //       required String permennt_address,
  //       required String married_status,
  //       required String no_of_childern,
  //       required String qualification,
  //       required String lend_amount,
  //       required String emergency_family_name,
  //       required String emergency_friend_name,
  //       required String relationShipWithFamilyMember,
  //       required File cnicFront,
  //       required File cnicBack,
  //     })
  //     async {
  //       final credential = await adduser.FirebaseFirestore.instance
  //           .collection('users')
  //         //  .doc(_firebaseAuth.currentUser?.uid)
  //           .doc('40')
  //           .set({
  //         'phoneNo' : phNo,
  //         'name': name,
  //         'map_lat': map_lat,
  //         'map_long': map_long,
  //         'complete_name': complete_name,
  //         'cnic': cnic,
  //         'cnic_exipry': cnic_exipry,
  //         'dob': dob,
  //         'current_address': current_address,
  //         'permennt_address': permennt_address,
  //         'married_status': married_status,
  //         'no_of_childern': no_of_childern,
  //         'qualification': qualification,
  //         'lend_amount': lend_amount,
  //         'emergency_family_name': emergency_family_name,
  //         'emergency_friend_name': emergency_friend_name,
  //         'relationship_with_family_member': relationShipWithFamilyMember,
  //
  //         //'uId': _firebaseAuth.currentUser?.uid,
  //       });
  //       final Reference storageRef =
  //       FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');
  //
  //       final TaskSnapshot taskSnapshot = await storageRef.putFile(File(cnicFront.path));
  //       final TaskSnapshot taskSnapshot2 = await storageRef.putFile(File(cnicBack.path));
  //
  //       final String downloadUrl = await storageRef.getDownloadURL();
  //
  //       print('File Uploaded: $downloadUrl');
  //     }
  Future<User?> createUserWithEmailAndPassword(
    BuildContext context, {
    required String phNo,
    required String name,
    required String map_lat,
    required String map_long,
    required String cnicName,
    required String cnic,
    required String cnic_exipry,
    required String dob,
    required String current_address,
    required String permennt_address,
    required String married_status,
    required String no_of_childern,
    required String qualification,
    required String loanAmount,
    required String emergency_family_name,
    required String emergency_famly_number,
    required String emergency_friend_number,
    required String emergency_friend_name,
    required String relationShip,
    required File cnicFront,
    required File cnicBack,
    required File selfi_withCNIC,
    required File selfi,
    required File bill_card_pic,
  }) async {
    try {
      final userDoc =
          await adduser.FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser?.uid).set({
        'phoneNo': phNo,
        'name': name,
        'map_lat': map_lat,
        'map_long': map_long,
        'cnicName': cnicName,
        'cnic': cnic,
        'cnic_exipry': cnic_exipry,
        'dob': dob,
        'current_address': current_address,
        'permennt_address': permennt_address,
        'married_status': married_status,
        'no_of_childern': no_of_childern,
        'qualification': qualification,
        'loanAmount': loanAmount,
        // 'emergency_family_name': emergency_family_name,
        // 'emergency_famly_number': emergency_famly_number,
        // 'emergency_friend_number': emergency_friend_number,
        // 'emergency_friend_number': emergency_friend_number,
        'relationShip': relationShip,
      });

      final cnicFrontRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-cnicFront.png');
      try {
        final cnicFrontTask = await cnicFrontRef.putFile(cnicFront);
        final cnicFrontUrl = await (await cnicFrontTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }

      final cnicBackRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-cnicBack.png');
      try {
        final cnicBackTask = await cnicBackRef.putFile(cnicBack);
        final cnicBackUrl = await (await cnicBackTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }
      ////////////////
      final billCardPicRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-bill_card_pic.png');
      try {
        final billCardTask = await billCardPicRef.putFile(bill_card_pic);
        final billCardUrl = await (await billCardTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }

      final selfiRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-selfi.png');
      try {
        final selfiTask = await selfiRef.putFile(selfi);
        final selfiUrl = await (await selfiTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }
      final selfi_withCNICRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-selfi_withCNIC.png');
      try {
        final selfi_withCNICTask = await selfi_withCNICRef.putFile(selfi_withCNIC);
        final selfi_withCNICUrl = await (await selfi_withCNICTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }





      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // } catch (e) {
  //   print('Exception @createAccount: $e');
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(e.toString())),
  //   );
  //   notifyListeners();
  // }
  Future<UserDataModel?> getUserData() async {
    final userDoc = await adduser.FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .get();
    if (userDoc.exists) {
      return UserDataModel.fromDocumentSnapshot(userDoc);
    } else {
      return null;
    }
  }

  Future<void> updateUser(
      String firstName, String lastName, String email, String password) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .update({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

enum ConfirmAction { Cancel, Accept }

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

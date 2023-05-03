import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' as adduser;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/extensions/cath_fireBase_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../healper/exception.dart';
import '../model/user_model.dart';
import '../screens/homeScreens/dasbBoard_Screen.dart';
import '../screens/homeScreens/home_screen.dart';

class RegistrationServicesProvider extends ChangeNotifier {
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
/////////////////////////////////////////
        required String device,
        required String brand,
        required String isPhysicalDevice,
        required String version_sdkInt,
        required String manufacturer,
        required String model,
        required String board,
        required String display,
        required String fingerprint,
        required String hardware,
        required String id,
        required String product,
        required String androidId,

        required String appName,
        required String idName,
        required String version,
        required String buildNumber,


      }) async {
    try {
      String? cnicFrontUrl;
      String? cnicBackUrl;
      String? billCardUrl;
      String? selfiUrl;
      String? selfi_withCNICUrl;
      final cnicFrontRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-cnicFront.png');
      try {
        final cnicFrontTask = await cnicFrontRef.putFile(cnicFront);
        cnicFrontUrl = await (cnicFrontTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }

      final cnicBackRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-cnicBack.png');
      try {
        final cnicBackTask = await cnicBackRef.putFile(cnicBack);
        cnicBackUrl = await (await cnicBackTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }
      ////////////////
      final billCardPicRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-bill_card_pic.png');
      try {
        final billCardTask = await billCardPicRef.putFile(bill_card_pic);
        billCardUrl = await (await billCardTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }

      final selfiRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-selfi.png');
      try {
        final selfiTask = await selfiRef.putFile(selfi);
        selfiUrl = await (await selfiTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }
      final selfi_withCNICRef = FirebaseStorage.instance
          .ref()
          .child('images/${_firebaseAuth.currentUser?.uid}-selfi_withCNIC.png');
      try {
        final selfi_withCNICTask =
        await selfi_withCNICRef.putFile(selfi_withCNIC);
        selfi_withCNICUrl =
        await (await selfi_withCNICTask).ref.getDownloadURL();
      } catch (e) {
        print(e.toString());
      }
      final userDoc = await adduser.FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
        'userUID': _firebaseAuth.currentUser?.uid,
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
        "cnicFrontUrl": cnicFrontUrl,
        "cnicBackUrl": cnicBackUrl,
        "selfiUrl": selfiUrl,
        "selfi_withCNICUrl": selfi_withCNICUrl,
        "billCardUrl": billCardUrl,
        'emergency_family_name': emergency_family_name,
        'emergency_famly_number': emergency_famly_number,
         'emergency_friend_name': emergency_friend_name,
         'emergency_friend_number': emergency_friend_number,
        'relationShip': relationShip,
      });

      final userApiDoc = await adduser.FirebaseFirestore.instance
          .collection('usersApiInfo')
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
        'userUID': _firebaseAuth.currentUser?.uid,
        'brand': brand,
        'device': device,
        'isPhysicalDevice': isPhysicalDevice,
        'version_sdkInt': version_sdkInt,
        'manufacturer': manufacturer,
        'model': model,
        'board': board,
        'display': display,
        'fingerprint': fingerprint,
        'hardware': hardware,
        'id': id,
        'product': product,
        'androidId': androidId,
        'appName': appName,
        'idName': idName,
        'version': version,
        'buildNumber': buildNumber,


      });

      final addStatus = await adduser.FirebaseFirestore.instance
          .collection('userStatus')
          .doc(_firebaseAuth.currentUser?.uid)
          .set({
        'userUID': _firebaseAuth.currentUser?.uid,
        'userStatus': "In Review",
      });

//after the login REST api call && response code ==200
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', "${_firebaseAuth.currentUser?.uid}");


      await prefs.setBool('isUser', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
        //  MaterialPageRoute(builder: (context) => HomeScreen()),
      );

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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

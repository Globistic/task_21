import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? uid;
  final String? email;
  late String password;
  late String first_name;
  late String last_name;

  User(this.uid, this.email);
}

class UserDataModel {
  final String? phoneNo;
  final String? name;
  final String? map_lat;
  final String? map_long;
  final String? cnicName;
  final String? cnic;
  final String? cnic_exipry;
  final String? dob;
  final String? current_address;
  final String? permennt_address;
  final String? married_status;
  final int? no_of_childern;
  final String? qualification;
  final int? loanAmount;
  final String? emergency_family_name;
  final String? emergency_famly_number;
  final String? relationShip;

  UserDataModel({
    this.phoneNo,
    this.name,
    this.map_lat,
    this.map_long,
    this.cnicName,
    this.cnic,
    this.cnic_exipry,
    this.dob,
    this.current_address,
    this.permennt_address,
    this.married_status,
    this.no_of_childern,
    this.qualification,
    this.loanAmount,
    this.emergency_family_name,
    this.emergency_famly_number,
    this.relationShip,
  });

  factory UserDataModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return UserDataModel(
      phoneNo: data['phoneNo'],
      name: data['name'],
      map_lat: data['map_lat'],
      map_long: data['map_long'],
      cnicName: data['cnicName'],
      cnic: data['cnic'],
      cnic_exipry: data['cnic_exipry'],
      dob: data['dob'],
      current_address: data['current_address'],
      permennt_address: data['permennt_address'],
      married_status: data['married_status'],
      no_of_childern: data['no_of_childern'],
      qualification: data['qualification'],
      loanAmount: data['loanAmount'],
      emergency_family_name: data['emergency_family_name'],
      emergency_famly_number: data['emergency_famly_number'],
      relationShip: data['relationShip'],
    );
  }
}

class GetAllUserDataModel {
  final String? userUID;
  final String? phoneNo;
  final String? name;
  final String? map_lat;
  final String? map_long;
  final String? cnicName;
  final String? cnic;
  final String? cnic_exipry;
  final String? dob;
  final String? current_address;
  final String? permennt_address;
  final String? married_status;
  final String? no_of_childern;
  final String? qualification;
  final String? loanAmount;
  final String? emergency_family_name;
  final String? emergency_famly_number;
  final String? emergency_friend_name;
  final String? emergency_friend_number;
  final String? relationShip;
  final String? cnicFrontUrl;
  final String? cnicBackUrl;
  final String? billCardUrl;
  final String? selfiUrl;
  final String? selfi_withCNICUrl;

  GetAllUserDataModel({
    this.userUID,
    this.phoneNo,
    this.name,
    this.map_lat,
    this.map_long,
    this.cnicName,
    this.cnic,
    this.cnic_exipry,
    this.dob,
    this.current_address,
    this.permennt_address,
    this.married_status,
    this.no_of_childern,
    this.qualification,
    this.loanAmount,
    this.emergency_family_name,
    this.emergency_famly_number,
    this.emergency_friend_number,
    this.emergency_friend_name,
    this.relationShip,
    this.cnicFrontUrl,
    this.cnicBackUrl,
    this.billCardUrl,
    this.selfiUrl,
    this.selfi_withCNICUrl,
  });

  factory GetAllUserDataModel.fromDocumentSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return GetAllUserDataModel(
      phoneNo: data['phoneNo'],
      name: data['name'],
      map_lat: data['map_lat'],
      map_long: data['map_long'],
      cnicName: data['cnicName'],
      cnic: data['cnic'],
      cnic_exipry: data['cnic_exipry'],
      dob: data['dob'],
      current_address: data['current_address'],
      permennt_address: data['permennt_address'],
      married_status: data['married_status'],
      no_of_childern: data['no_of_childern'],
      qualification: data['qualification'],
      loanAmount: data['loanAmount'],
      emergency_family_name: data['emergency_family_name'],
      emergency_famly_number: data['emergency_famly_number'],
      relationShip: data['relationShip'],
      cnicFrontUrl: data['cnicFrontUrl'],
      cnicBackUrl: data['cnicBackUrl'],
      billCardUrl: data['billCardUrl'],
      selfiUrl: data['selfiUrl'],
      selfi_withCNICUrl: data['selfi_withCNICUrl'],
    );
  }

}
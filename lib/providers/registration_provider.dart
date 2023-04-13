//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../bloc/registration_form/event.dart';
// import 'auth_provider.dart';
//
// class SignUpProvider extends ChangeNotifier {
//   TextEditingController firstNameController = TextEditingController();
//   AuthServicesProvider authService = AuthServicesProvider();
//   bool _isLoadingIndicator = false;
//
//   bool get isLoadingIndicator => _isLoadingIndicator;
//
//   set isLoadingIndicator(bool value) {
//     _isLoadingIndicator = value;
//     notifyListeners();
//   }
//
//   void clearController() {
//     firstNameController.clear();
//     notifyListeners();
//   }
//
//   Future<void> submitData(BuildContext context, String phone ,  ) async {
//     isLoadingIndicator = true;
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('LOADING')));
//
//     await authService.createUserWithEmailAndPassword(
//       phNo : phoneNumber,
//       context,
//       name: event.name,
//       map_lat: event.map_lat,
//       map_long: event.map_long,
//       complete_name: event.complete_name,
//       cnic: event.cnic,
//       cnic_exipry: event.cnic_exipry,
//       dob: event.dob,
//       current_address: event.current_address,
//       permennt_address: event.permennt_address,
//       married_status: event.married_status,
//       no_of_childern: event.no_of_childern,
//       qualification: event.qualification,
//       lend_amount: event.lend_amount,
//       emergency_family_name: event.emergency_family_name,
//       emergency_friend_name: event.emergency_friend_name,
//       relationShipWithFamilyMember: event.relationShipWithFamilyMember,
//     );
//
//     isLoadingIndicator = false;
//     clearController();
//     notifyListeners();
//   }
// }

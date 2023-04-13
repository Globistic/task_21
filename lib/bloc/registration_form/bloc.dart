import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_21/bloc/registration_form/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  // Firebase references
 final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Constructor
  RegistrationBloc() : super(RegistrationInitial());

  // State getters
 @override
 Stream<RegistrationState> mapEventToState(
     RegistrationEvent event,
     ) async* {
   if (event is RegistrationSubmitted) {
     yield RegistrationLoading();

     try {
       // Get the current user's UID
       String uid = _auth.currentUser!.uid;

       // Merge the registration data into a single Map object
       Map<String, dynamic> registrationData = {
         'phoneNumber': event.phoneNumber,
         'name': event.name,
         'map_lat': event.map_lat,
         'map_long': event.map_long,
         'complete_name': event.complete_name,
         'cnic': event.cnic,
         'cnic_exipry': event.cnic_exipry,
         'dob': event.dob,
         'current_address': event.current_address,
         'permennt_address': event.permennt_address,
         'married_status': event.married_status,
         'no_of_childern': event.no_of_childern,
         'qualification': event.qualification,
         'lend_amount': event.lend_amount,
         'emergency_family_name': event.emergency_family_name,
         'emergency_friend_name': event.emergency_friend_name,
         'relationShipWithFamilyMember': event.relationShipWithFamilyMember,

       };


       // Save the registration data to Firebase
       await _firestore
           .collection('users')
           .doc(uid)
           .set(registrationData);

       yield RegistrationSuccess();




     } catch (e) {
       yield RegistrationFailure(errorMessage: e.toString());
     }
   }
 }

}

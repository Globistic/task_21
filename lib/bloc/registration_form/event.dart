import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends RegistrationEvent {
  const InitEvent();
}


class RegistrationSubmitted extends RegistrationEvent {
  final String phoneNumber;
  final String name;
  final String map_lat;
  final String map_long;
  final String complete_name;
  final String cnic;
  final String cnic_exipry;
  final String dob;
  final String current_address;
  final String permennt_address;
  final String married_status;
  final String no_of_childern;
  final String qualification;
  final String lend_amount;
  final String emergency_family_name;
  final String emergency_friend_name;
  final String relationShipWithFamilyMember;



  const RegistrationSubmitted({
    required this.phoneNumber,
    required this.relationShipWithFamilyMember,
    required this.name,
    required this.map_lat,
    required this.map_long,
    required this.complete_name,
    required this.cnic,
    required this.cnic_exipry,
    required this.dob,
    required this.current_address,
    required this.permennt_address,
    required this.married_status,
    required this.no_of_childern,
    required this.qualification,
    required this.lend_amount,
    required this.emergency_family_name,
    required this.emergency_friend_name,



  });

  @override
  List<Object> get props => [
    phoneNumber,
    name,
    map_long,
    map_long,
    complete_name,
    cnic,
    cnic_exipry,
    dob,
    current_address,
    permennt_address,
    married_status,
    no_of_childern,
    qualification,
    lend_amount,
    emergency_family_name,
    emergency_friend_name,
    relationShipWithFamilyMember,


  ];
}



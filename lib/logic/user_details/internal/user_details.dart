import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String fullName;
  final String displayName;
  final String email;
  final String phone;
  final DateTime birthDate;
  final Address address;
  @override
  List get props => [fullName, displayName, email, phone, birthDate, address];
  const UserDetails({
    required this.fullName,
    required this.displayName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.address,
  });
}

class Address extends Equatable {
  final String address;
  final String city;
  final String state;
  final String nation;
  final String zipCode;
  @override
  List get props => [address, city, state, nation, zipCode];
  const Address({
    required this.address,
    required this.city,
    required this.state,
    required this.nation,
    required this.zipCode,
  });
}

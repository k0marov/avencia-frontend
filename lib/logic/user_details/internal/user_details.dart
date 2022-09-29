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

  UserDetails copyWith({
    String? fullName,
    String? displayName,
    String? email,
    String? phone,
    DateTime? birthDate,
    Address? address,
  }) =>
      UserDetails(
        fullName: fullName ?? this.fullName,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        birthDate: birthDate ?? this.birthDate,
        address: address ?? this.address,
      );
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

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? nation,
    String? zipCode,
  }) =>
      Address(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        nation: nation ?? this.nation,
        zipCode: zipCode ?? this.zipCode,
      );
}

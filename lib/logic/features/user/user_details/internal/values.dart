import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String fullName;
  final String lastName;
  final String phone;
  final DateTime birthDate;
  @override
  List get props => [fullName, lastName, phone, birthDate];
  const UserDetails({
    required this.fullName,
    required this.lastName,
    required this.phone,
    required this.birthDate,
  });

  UserDetails copyWith({
    String? fullName,
    String? lastName,
    String? phone,
    DateTime? birthDate,
    Address? address,
  }) =>
      UserDetails(
        fullName: fullName ?? this.fullName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        birthDate: birthDate ?? this.birthDate,
      );
}

class Address extends Equatable {
  final String address;
  final String city;
  final String state;
  final String zipCode;
  @override
  List get props => [address, city, state, zipCode];
  const Address({
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? zipCode,
  }) =>
      Address(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
      );
}

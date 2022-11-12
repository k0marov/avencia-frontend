import 'package:avencia/logic/features/user/user_details/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/general.dart';

class UserDetailsMapper implements InpMapper<UserDetails>, OutMapper<UserDetails> {
  @override
  UserDetails fromJson(Map<String, dynamic> json) {
    return UserDetails(
      fullName: json["full_name"],
      lastName: json["last_name"],
      phone: json["phone"],
      birthDate: fromUnixSec(json["birth_date"]),
    );
  }

  @override
  Map<String, dynamic> toJson(UserDetails v) => {
        "full_name": v.fullName,
        "display_name": v.lastName,
        "phone": v.phone,
        "birth_date": toUnixSec(v.birthDate),
      };
}

class AddressMapper implements FullMapper<Address> {
  @override
  Address fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipcode"],
      );

  @override
  Map<String, dynamic> toJson(Address v) => {
        "address": v.address,
        "city": v.city,
        "state": v.state,
        "zipcode": v.zipCode,
      };
}

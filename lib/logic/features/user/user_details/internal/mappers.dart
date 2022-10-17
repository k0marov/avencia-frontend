import 'package:avencia/logic/features/user/user_details/internal/user_details.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/general.dart';

class UserDetailsMapper implements InpMapper<UserDetails>, OutMapper<UserDetails> {
  @override
  UserDetails fromJson(Map<String, dynamic> json) {
    return UserDetails(
      fullName: json["full_name"],
      displayName: json["display_name"],
      phone: json["phone"],
      birthDate: fromUnixSec(json["birth_date"]),
      address: Address(
        address: json["address"]["address"],
        city: json["address"]["city"],
        state: json["address"]["state"],
        nation: json["address"]["nation"],
        zipCode: json["address"]["zipcode"],
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(UserDetails v) => {
        "full_name": v.fullName,
        "display_name": v.displayName,
        "phone": v.phone,
        "birth_date": toUnixSec(v.birthDate),
        "address": {
          "address": v.address.address,
          "city": v.address.city,
          "state": v.address.state,
          "nation": v.address.nation,
          "zip_code": v.address.zipCode,
        }
      };
}

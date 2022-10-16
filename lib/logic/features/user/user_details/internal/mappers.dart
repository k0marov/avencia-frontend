import 'package:avencia/logic/features/user/user_details/internal/user_details.dart';
import 'package:helpers/logic/entity/entity.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/general.dart';

class UserDetailsMapper implements InpMapper<Entity<UserDetails>>, OutMapper<Entity<UserDetails>> {
  @override
  Entity<UserDetails> fromJson(Map<String, dynamic> json) {
    return Entity<UserDetails>(
      json["id"],
      UserDetails(
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
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(Entity<UserDetails> v) => {
        "id": v.id,
        "full_name": v.o.fullName,
        "display_name": v.o.displayName,
        "phone": v.o.phone,
        "birth_date": toUnixSec(v.o.birthDate),
        "address": {
          "address": v.o.address.address,
          "city": v.o.address.city,
          "state": v.o.address.state,
          "nation": v.o.address.nation,
          "zip_code": v.o.address.zipCode,
        }
      };
}
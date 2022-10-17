import 'package:avencia/logic/features/user/kyc/internal/status.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

extension StatusStringer on Status {
  String get string {
    switch (this) {
      case Status.unset:
        return "unset";
      case Status.pending:
        return "pending";
      case Status.verified:
        return "verified";
      case Status.rejected:
        return "rejected";
    }
  }
}

class StatusMapper implements FullMapper<Status> {
  @override
  Map<String, dynamic> toJson(Status v) => {
        "status": v.string,
      };

  @override
  Status fromJson(Map<String, dynamic> json) {
    switch (json["status"]) {
      case "unset":
        return Status.unset;
      case "pending":
        return Status.pending;
      case "rejected":
        return Status.rejected;
      case "accepted":
        return Status.verified;
      default:
        throw Exception("unknown status"); // TODO: replace with a proper Failure
    }
  }
}

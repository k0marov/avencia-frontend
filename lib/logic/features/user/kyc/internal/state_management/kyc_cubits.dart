import 'package:avencia/logic/features/user/kyc/internal/state_management/kyc_images_cubit.dart';
import 'package:avencia/logic/features/user/kyc/internal/state_management/kyc_status_cubit.dart';

class KycCubits {
  final KycImagesCubit Function() images;
  final KycStatusCubit Function() status;
  const KycCubits(this.images, this.status);
}

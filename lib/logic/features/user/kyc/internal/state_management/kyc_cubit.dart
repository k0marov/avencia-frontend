import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/cubit_extension.dart';
import 'package:helpers/logic/uploader/simple_file.dart';
import 'package:helpers/logic/uploader/uploader.dart';

import '../../usecases.dart';
import '../status.dart';

part 'kyc_agreements.dart';
part 'kyc_images.dart';
part 'kyc_status.dart';

class KycState extends Equatable {
  final StatusState status;
  final ImagesState images;
  final AgreementsState agreements;
  @override
  List get props => [status, images, agreements];
  const KycState(this.status, this.images, this.agreements);

  KycState withImages(ImagesState images) => KycState(status, images, agreements);
  KycState withStatus(StatusState status) => KycState(status, images, agreements);
  KycState withAgreements(AgreementsState agreements) => KycState(status, images, agreements);
}

/// For the methods see ImagesExtension, StatusExtension and AgreementsExtension
class KycCubit extends Cubit<KycState> {
  late final StatusExtension status;
  late final ImagesExtension images;
  late final AgreementsExtension agreements;
  KycCubit(StatusDeps statusDeps, ImagesDeps imgDeps, AgreementsDeps agreementsDeps)
      : super(
          KycState(
            StatusExtension.initialState(statusDeps),
            ImagesExtension.initialState(imgDeps),
            AgreementsExtension.initialState(agreementsDeps),
          ),
        ) {
    status = StatusExtension(
      statusDeps,
      (s) => emit(state.withStatus(s)),
      () => state.status,
    );
    images = ImagesExtension(
      imgDeps,
      (s) => emit(state.withImages(s)),
      () => state.images,
    );
    agreements = AgreementsExtension(
      agreementsDeps,
      (s) => emit(state.withAgreements(s)),
      () => state.agreements,
    );
  }

  bool get submitAllowed => images._imgsFilled() && agreements._allAgreed();
}

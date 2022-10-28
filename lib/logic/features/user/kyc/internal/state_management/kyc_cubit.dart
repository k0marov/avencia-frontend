import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/uploader/simple_file.dart';
import 'package:helpers/logic/uploader/uploader.dart';

import '../../usecases.dart';
import '../status.dart';

part 'kyc_agreements.dart';
part 'kyc_images.dart';
part 'kyc_status.dart';

class KycState extends Equatable {
  final ImagesState images;
  final StatusState status;
  final AgreementsState agreements;
  @override
  List get props => [images, status, agreements];
  const KycState(this.images, this.status, this.agreements);

  KycState withImages(ImagesState images) => KycState(images, status, agreements);
  KycState withStatus(StatusState status) => KycState(images, status, agreements);
  KycState withAgreements(AgreementsState agreements) => KycState(images, status, agreements);
}

// TODO: replace extensions with proper classes that just take emit() as a constructor argument

/// For the methods see ImagesExtension, StatusExtension and AgreementsExtension
class KycCubit extends Cubit<KycState> {
  final ImagesDeps _imgDeps;
  final StatusDeps _statusDeps;
  final AgreementsDeps _agreementsDeps;
  KycCubit(this._imgDeps, this._statusDeps, this._agreementsDeps)
      : super(KycState(
          initialImagesState(_imgDeps),
          initialStatusState(_statusDeps),
          initialAgreementsState(_agreementsDeps),
        )) {
    refreshStatus();
  }

  bool get submitAllowed => _imgsFilled() && _allAgreed();
}

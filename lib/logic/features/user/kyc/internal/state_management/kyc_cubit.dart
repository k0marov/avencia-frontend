import 'package:avencia/logic/core/uploader/uploader.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/core.dart';

import '../../../../../core/uploader/simple_file.dart';
import '../../usecases.dart';
import '../status.dart';

part 'kyc_images.dart';
part 'kyc_status.dart';

class KycState extends Equatable {
  final ImagesState images;
  final StatusState status;
  @override
  List get props => [images, status];
  const KycState(this.images, this.status);

  KycState withImages(ImagesState images) => KycState(images, status);
  KycState withStatus(StatusState status) => KycState(images, status);
}

/// For the methods see ImagesExtension and StatusExtension
class KycCubit extends Cubit<KycState> {
  final ImagesDeps _imgDeps;
  final StatusDeps _statusDeps;
  KycCubit(this._imgDeps, this._statusDeps)
      : super(KycState(
          initialImagesState(_imgDeps),
          initialStatusState(_statusDeps),
        ));

  bool get submitAllowed => _imgsFilled();
}

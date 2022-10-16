import 'package:avencia/config/const.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/uploader/simple_file.dart';
import '../../../core/uploader/uploader.dart';

// TODO: maybe the passport cubit could be a FormCubit with a wisely chosen State

// TODO: add the pending state for the case when user has already uploaded his passport

// true means the file is successfully uploaded; false means the user have not even started the upload
typedef FileUploadState = Option<Either<Exception, bool>>;

class PassportState extends Equatable {
  final FileUploadState front;
  final FileUploadState back;
  @override
  List get props => [front, back];
  const PassportState(this.front, this.back);

  PassportState withFront(FileUploadState front) => PassportState(front, back);
  PassportState withBack(FileUploadState back) => PassportState(front, back);
}

// TODO: add tbe agreements states

class PassportCubit extends Cubit<PassportState> {
  final Uploader uploader;
  PassportCubit(this.uploader) : super(const PassportState(Some(Right(false)), Some(Right(false))));

  // TODO: remove code duplication

  bool canBeSubmitted() =>
      state.front.fold(() => false, (some) => some.fold((e) => false, (s) => s)) &&
      state.back.fold(() => false, (some) => some.fold((e) => false, (s) => s));

  void frontUploadPressed(SimpleFile file) {
    emit(state.withFront(const None()));
    uploader(passportFrontEndpoint, file).then(
      (res) => res.fold(
        (e) => emit(state.withFront(Some(Left(e)))),
        (success) => emit(state.withFront(const Some(Right(true)))),
      ),
    );
  }

  void backUploadPressed(SimpleFile file) {
    emit(state.withBack(const None()));
    uploader(passportBackEndpoint, file).then(
      (res) => res.fold(
        (e) => emit(state.withBack(Some(Left(e)))),
        (success) => emit(state.withBack(const Some(Right(true)))),
      ),
    );
  }
}

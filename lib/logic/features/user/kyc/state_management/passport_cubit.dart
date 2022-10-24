import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/user/kyc/internal/status.dart';
import 'package:avencia/logic/features/user/kyc/usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/core.dart';

import '../../../../core/uploader/simple_file.dart';
import '../../../../core/uploader/uploader.dart';

part 'passport_state.dart';

class PassportCubit extends Cubit<PassportState> {
  final Uploader _upld;
  final PassportStatusGetter _getStatus;
  final PassportSubmitter _submitPassport;
  PassportCubit(this._upld, this._getStatus, this._submitPassport) : super(None()) {
    _loadStatus();
  }

  void refresh() {
    _loadStatus();
  }

  void submitPressed() {
    state.forLoaded((state) {
      if (!state.canBeSubmitted) {
        emit(Some(Left(Exception("The form cannot be submitted"))));
        return;
      }
      _submitPassport().then((result) => result.fold(
            (e) => Some(Left(e)),
            (r) => refresh(),
          ));
    });
  }

  // TODO: remove code duplication
  void frontUploadPressed(SimpleFile file) {
    state.forLoaded((state) {
      // TODO: please simplify this
      emit(Some(Right(state.withImages(state.images.withFront(None())))));
      _upld(passportFrontEndpoint, file).then(
        (res) => res.fold(
          (e) => emit(Some(Right(state.withImages(state.images.withFront(Some(Left(e))))))),
          (success) =>
              emit(Some(Right(state.withImages(state.images.withFront(Some(Right(true))))))),
        ),
      );
    });
  }

  void backUploadPressed(SimpleFile file) {
    state.forLoaded((state) {
      emit(Some(Right(state.withImages(state.images.withBack(None())))));
      _upld(passportBackEndpoint, file).then(
        (res) => res.fold(
          (e) => emit(Some(Right(state.withImages(state.images.withBack(Some(Left(e))))))),
          (success) =>
              emit(Some(Right(state.withImages(state.images.withBack(Some(Right(true))))))),
        ),
      );
    });
  }

  void _loadStatus() {
    _getStatus().then((result) => result.fold(
          (e) => emit(Some(Left(e))),
          (status) => emit(Some(Right(LoadedState(status)))),
        ));
  }
}

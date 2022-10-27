import 'package:avencia/logic/core/uploader/simple_file.dart';
import 'package:avencia/logic/core/uploader/uploader.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

// true means the file is successfully uploaded; false means the user have not even started the upload
// none means the file is uploading
typedef FileUploadState = Option<Either<Exception, bool>>;
typedef KycImagesState = List<FileUploadState>;

/// endpoints
class KycImagesCubit extends Cubit<KycImagesState> {
  final List<String> _endpoints;
  final Uploader _upld;
  KycImagesCubit(this._endpoints, this._upld)
      : super(List.filled(_endpoints.length, Some(Right(false))));

  bool allFilled() => state.every(
        (s) => s.fold(
          () => false,
          (some) => some.fold(
            (l) => false,
            (loaded) => loaded,
          ),
        ),
      );

  void upload(int index, SimpleFile file) {
    _setImageState(index, None());

    _upld(_endpoints[index], file).then(
      (result) => result.fold(
        (e) => _setImageState(index, Some(Left(e))),
        (success) => _setImageState(index, Some(Right(true))),
      ),
    );
  }

  void _setImageState(int index, FileUploadState newState) {
    final changedState = state;
    changedState[index] = newState;
    emit(changedState);
  }
}

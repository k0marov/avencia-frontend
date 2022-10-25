import 'package:avencia/logic/core/uploader/simple_file.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:helpers/logic/core.dart';

// true means the file is successfully uploaded; false means the user have not even started the upload
// none means the file is uploading
typedef FileUploadState = Option<Either<Exception, bool>>;
typedef KycImagesState = List<FileUploadState>;

class KycImagesCubit extends Cubit<KycImagesState> {
  final int _amount;
  final Future<UseCaseRes<void>> Function(SimpleFile) _upld;
  KycImagesCubit(this._amount, this._upld) : super(List.filled(_amount, Some(Right(false))));

  bool allFilled() => state.every((s) => s.fold(() => false, (some) => some.isRight()));

  void upload(int index, SimpleFile file) {
    _setImageState(index, None());

    _upld(file).then(
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

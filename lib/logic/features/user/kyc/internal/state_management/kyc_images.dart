part of 'kyc_cubit.dart';

// true means the file is successfully uploaded; false means the user has not even started the upload
// none means the file is uploading

typedef FileUploadState = Option<Either<Exception, bool>>;
typedef ImagesState = List<FileUploadState>;

class ImagesDeps extends Equatable {
  final List<String> endpoints;
  final Uploader upld;
  List get props => [endpoints, upld];
  const ImagesDeps(this.endpoints, this.upld);
}

class ImagesExtension {
  final ImagesDeps _deps;
  final ExtensionEmitter<ImagesState> _emit;
  final StateGetter<ImagesState> _getState;
  const ImagesExtension(this._deps, this._emit, this._getState);

  static ImagesState initialState(ImagesDeps deps) =>
      List.filled(deps.endpoints.length, Some(Right(false)));

  void upld(int index, SimpleFile file) {
    _setImageState(index, None());

    _deps.upld(_deps.endpoints[index], file).then(
          (result) => result.fold(
            (e) => _setImageState(index, Some(Left(e))),
            (success) => _setImageState(index, Some(Right(true))),
          ),
        );
  }

  void _setImageState(int index, FileUploadState newState) {
    // you have to copy the current images state, otherwise it will not be changed
    final changedState = [..._getState()];
    changedState[index] = newState;
    _emit(changedState);
  }

  bool _imgsFilled() => _getState().every(
        (s) => s.fold(
          () => false,
          (some) => some.fold(
            (l) => false,
            (loaded) => loaded,
          ),
        ),
      );
}

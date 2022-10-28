part of 'kyc_cubit.dart';

// true means the file is successfully uploaded; false means the user have not even started the upload
// none means the file is uploading

typedef FileUploadState = Option<Either<Exception, bool>>;
typedef ImagesState = List<FileUploadState>;

class ImagesDeps extends Equatable {
  final List<String> endpoints;
  final Uploader upld;
  List get props => [endpoints, upld];
  const ImagesDeps(this.endpoints, this.upld);
}

ImagesState initialImagesState(ImagesDeps deps) =>
    List.filled(deps.endpoints.length, Some(Right(false)));

extension ImagesExtension on KycCubit {
  void uploadImg(int index, SimpleFile file) {
    _setImageState(index, None());

    _imgDeps.upld(_imgDeps.endpoints[index], file).then(
          (result) => result.fold(
            (e) => _setImageState(index, Some(Left(e))),
            (success) => _setImageState(index, Some(Right(true))),
          ),
        );
  }

  void _setImageState(int index, FileUploadState newState) {
    // you have to copy the current images state, otherwise it will not be changed
    final changedState = [...state.images];
    changedState[index] = newState;
    emit(state.withImages(changedState));
  }

  bool _imgsFilled() => state.images.every(
        (s) => s.fold(
          () => false,
          (some) => some.fold(
            (l) => false,
            (loaded) => loaded,
          ),
        ),
      );
}

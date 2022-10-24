part of 'passport_cubit.dart';

typedef PassportState = BlocState<LoadedState>;

// TODO: add tbe agreements states

// true means the file is successfully uploaded; false means the user have not even started the upload
typedef FileUploadState = Option<Either<Exception, bool>>;

class ImagesState extends Equatable {
  final FileUploadState front;
  final FileUploadState back;
  @override
  List get props => [front, back];
  const ImagesState(this.front, this.back);

  bool get canBeSubmitted =>
      front.fold(() => false, (some) => some.fold((e) => false, (s) => s)) &&
      back.fold(() => false, (some) => some.fold((e) => false, (s) => s));

  ImagesState withFront(FileUploadState front) => ImagesState(front, back);
  ImagesState withBack(FileUploadState back) => ImagesState(front, back);
}

class LoadedState extends Equatable {
  final ImagesState images;
  final Status status;

  @override
  List get props => [images, status];
  const LoadedState(
    this.status, [
    this.images = const ImagesState(Some(Right(false)), Some(Right(false))),
  ]);

  bool get canBeSubmitted =>
      images.canBeSubmitted && status != Status.pending && status != Status.verified;

  LoadedState withImages(ImagesState images) => LoadedState(status, images);
  LoadedState withStatus(Status status) => LoadedState(status, images);
}

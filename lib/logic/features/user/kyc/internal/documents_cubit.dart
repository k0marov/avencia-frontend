import 'package:bloc/bloc.dart';

enum DocumentsState {
  passport,
  nationalId,
  drivingLicense,
}

class DocumentsCubit extends Cubit<DocumentsState> {
  DocumentsCubit() : super(DocumentsState.passport);

  void documentChosen(DocumentsState doc) => emit(doc);
}

import 'package:avencia/logic/core/entity/entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FormCubitState<V> extends Equatable {
  final V? val;
  final bool updated;
  final Exception? exception;
  @override
  List get props => [val, updated, exception];
  const FormCubitState([this.val, this.updated = false, this.exception]);
}

class FormCubit<V extends Value> extends Cubit<FormCubitState<V>> {
  final Reader<V> _read;
  final Updater<V> _upd;
  final String _id;
  FormCubit(
    this._read,
    this._upd,
    this._id,
  ) : super(const FormCubitState()) {
    _fetchAndEmit();
  }

  void valueEdited(V newValue) {
    emit(FormCubitState(newValue, false, state.exception));
  }

  void updatePressed() {
    final currentVal = state.val;
    if (currentVal != null) {
      _updateAndEmit(currentVal);
    }
  }

  void _fetchAndEmit() {
    _read(_id).then(
      (res) => res.fold(
        (e) => emit(FormCubitState(state.val, false, e)),
        (newV) => emit(FormCubitState(newV.o)),
      ),
    );
  }

  void _updateAndEmit(V newV) {
    _upd(Entity<V>(_id, newV)).then(
      (res) => res.fold(
        (e) => emit(FormCubitState(state.val, true, e)),
        (success) => emit(FormCubitState(newV, true)),
      ),
    );
  }
}

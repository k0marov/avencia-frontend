import 'package:avencia/logic/core/entity/entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum UpdateState {
  unchanged,
  updating,
  updated,
}

class FormCubitState<V> extends Equatable {
  final V? _initial;
  final V? val;
  final UpdateState upd;
  final Exception? exception;
  @override
  List get props => [_initial, val, upd, exception];
  const FormCubitState([this._initial, this.val, this.upd = UpdateState.unchanged, this.exception]);

  bool updateAvailable() => _initial != val && val != null;

  FormCubitState<V> withValue(V? val) => FormCubitState<V>(_initial, val, upd, exception);
  FormCubitState<V> withUpdState(UpdateState upd) => FormCubitState<V>(_initial, val, upd, exception);
  FormCubitState<V> withException(Exception? e) => FormCubitState<V>(_initial, val, upd, e);
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
    emit(state.withUpdState(UpdateState.unchanged).withValue(newValue));
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
        (e) => emit(state.withException(e)),
        (newV) => emit(FormCubitState(newV.o, newV.o)),
      ),
    );
  }

  void _updateAndEmit(V newV) {
    emit(state.withUpdState(UpdateState.updating));
    _upd(Entity<V>(_id, newV)).then(
      (res) => res.fold(
        (e) => emit(state.withUpdState(UpdateState.unchanged).withException(e)),
        (success) => emit(FormCubitState(newV, newV, UpdateState.updated)),
      ),
    );
  }
}

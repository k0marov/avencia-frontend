import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../logic/err/bloc_state.dart';

const loadingWidget = CircularProgressIndicator();
const exceptionWidget = Text("Oops, some error happened.", style: TextStyle(color: Colors.red));

Widget stateSwitch<S extends Equatable>({
  required BlocState<S> state,
  required Widget Function(S) loadedBuilder,
}) =>
    state.fold(
      () => loadingWidget,
      (some) => some.fold(
        (e) => exceptionWidget,
        (loaded) => loadedBuilder(loaded),
      ),
    );

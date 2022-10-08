import 'package:avencia/logic/err/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../logic/err/bloc_state.dart';

const loadingWidget = CircularProgressIndicator();

Widget stateSwitch<S extends Equatable>({
  required BlocState<S> state,
  required Widget Function(S) loadedBuilder,
}) =>
    state.fold(
      () => loadingWidget,
      (some) => some.fold(
        (e) => ExceptionWidget(exception: e),
        (loaded) => loadedBuilder(loaded),
      ),
    );

class ExceptionWidget extends StatelessWidget {
  final Exception exception;
  const ExceptionWidget({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(displayException(exception), style: TextStyle(color: Colors.red));
  }
}

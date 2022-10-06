import 'package:avencia/logic/err/bloc_state.dart';
import 'package:avencia/ui/err/exception_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// A BlocProvider that shows a SnackBar when a state with an exception is emitted
class BlocProviderWithExceptions<B extends BlocBase<BlocState<S>>, S extends Equatable>
    extends StatelessWidget {
  final StateStreamableSource Function(BuildContext) create;
  final Widget child;
  const BlocProviderWithExceptions({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: BlocListener<B, BlocState<S>>(
        listener: (context, state) => state.fold(
          () {},
          (some) => some.fold(
            (exception) => showExceptionSnackbar(context, exception),
            (_) {},
          ),
        ),
        child: child,
      ),
    );
  }
}

import 'package:avencia/ui/err/exception_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// A BlocProvider that shows a SnackBar when a state with an exception is emitted
class BlocProviderWithExceptions<B extends BlocBase<S>, S> extends StatelessWidget {
  final StateStreamableSource Function(BuildContext) create;
  final Exception? Function(S) getException;
  final Widget child;
  const BlocProviderWithExceptions({
    Key? key,
    required this.create,
    required this.getException,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: BlocListener<B, S>(
        listener: (context, state) {
          final exception = getException(state);
          if (exception != null) showExceptionSnackbar(context, exception);
        },
        child: child,
      ),
    );
  }
}

import 'package:avencia/di.dart';
import 'package:avencia/logic/err/errors.dart';
import 'package:avencia/ui/err/exception_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExceptionListener<B extends BlocBase<S>, S> extends StatelessWidget {
  final Exception? Function(S) getException;
  final Widget child;
  const BlocExceptionListener({
    Key? key,
    required this.getException,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: (context, state) {
        final e = getException(state);
        if (e != null) {
          if (e is NetworkException && e.statusCode == 401) {
            print("here");
            uiDeps.authFacade.refresh();
          } else {
            showExceptionSnackbar(context, e);
          }
        }
      },
      child: child,
    );
  }
}

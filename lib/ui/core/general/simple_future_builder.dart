import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

// TODO: replace this with some general cubit creator

class SimpleFutureBuilder<T> extends StatelessWidget {
  final Future<Either<Exception, T>> future;
  final Widget loading;
  final Widget Function(T) loadedBuilder;
  final Widget Function(Exception) exceptionBuilder;
  const SimpleFutureBuilder({
    Key? key,
    required this.future,
    required this.loading,
    required this.loadedBuilder,
    required this.exceptionBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (ctx, AsyncSnapshot<Either<Exception, T>> snapshot) => snapshot.hasData
            ? snapshot.data!.fold(
                (exception) => exceptionBuilder(exception),
                (result) => loadedBuilder(result),
              )
            : loading);
  }
}

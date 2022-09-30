import 'package:avencia/logic/core/cubit_form/form_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/core/entity/entity.dart';

class FormInfo<V extends Value> extends Equatable {
  final V current;
  final void Function(V) update;
  final Widget updButton;

  @override
  List get props => [current, update, updButton];
  const FormInfo(this.current, this.update, this.updButton);
}

class FormWidget<V extends Value> extends StatelessWidget {
  final FormCubit<V> Function() _cubitFactory;
  final Widget Function(FormInfo<V>) _bodyBuilder;
  const FormWidget({
    required FormCubit<V> Function() cubitFactory,
    required Widget Function(FormInfo<V>) bodyBuilder,
    Key? key,
  })  : _cubitFactory = cubitFactory,
        _bodyBuilder = bodyBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubitFactory(),
      child: BlocBuilder<FormCubit<V>, FormCubitState<V>>(
        builder: (context, FormCubitState<V> state) => state.val == null && state.exception == null
            ? AspectRatio(aspectRatio: 1, child: CircularProgressIndicator())
            : _bodyBuilder(
                FormInfo(
                  state.val!,
                  context.read<FormCubit<V>>().valueEdited,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.exception != null) Text(state.exception.toString()),
                      _getUpdIcon(state.upd),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: state.updateAvailable() ? context.read<FormCubit<V>>().updatePressed : null,
                        child: Text("Update"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _getUpdIcon(UpdateState upd) {
    switch (upd) {
      case UpdateState.unchanged:
        return Container();
      case UpdateState.updating:
        return const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        );
      case UpdateState.updated:
        return Icon(Icons.check, size: 20, color: Colors.green);
    }
  }
}

// TODO: add a general function for converting exceptions to user-readable text

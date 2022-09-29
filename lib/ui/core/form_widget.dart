import 'package:avencia/logic/core/cubit_form/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/core/entity/entity.dart';

class FormWidget<V extends Value> extends StatelessWidget {
  final FormCubit<V> Function() _cubitFactory;
  final Widget Function(V, Function(V)) _fields;
  const FormWidget({
    required FormCubit<V> Function() cubitFactory,
    required Widget Function(V v, Function(V) updV) fields,
    Key? key,
  })  : _cubitFactory = cubitFactory,
        _fields = fields,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubitFactory(),
      child: BlocBuilder<FormCubit<V>, FormCubitState<V>>(
          builder: (context, FormCubitState<V> state) => Column(children: [
                if (state.val == null && state.exception == null) CircularProgressIndicator(),
                if (state.val != null)
                  _fields(
                    state.val!,
                    context.read<FormCubit<V>>().valueEdited,
                  ),
                Row(children: [
                  if (state.exception != null) Text(state.exception.toString()),
                  if (state.updated) Icon(Icons.check, color: Colors.green),
                  ElevatedButton(
                    onPressed: state.val != null ? context.read<FormCubit<V>>().updatePressed : null,
                    child: Text("Update"),
                  ),
                ])
              ])),
    );
  }
}

// TODO: add a general function for converting exceptions to user-readable text

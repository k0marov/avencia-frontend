import 'package:avencia/logic/core/cubit_form/form_cubit.dart';
import 'package:avencia/ui/core/general/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/core/entity/entity.dart';

// TODO: remove this strange connection between personal details and address (maybe by making them separate entities)

class FormInfo<V extends Value> extends Equatable {
  final V current;
  final void Function(V) update;
  final Widget action;
  final bool isEditing;

  @override
  List get props => [current, update, action, isEditing];
  const FormInfo(this.current, this.update, this.action, this.isEditing);
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
            ? AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(80),
                  child: CircularProgressIndicator(),
                ),
              )
            : _bodyBuilder(
                FormInfo(
                  state.val!,
                  context.read<FormCubit<V>>().valueEdited,
                  _buildAction(context, state),
                  state.isEditing,
                ),
              ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, FormCubitState<V> state) {
    if (state.isEditing) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: context.read<FormCubit<V>>().cancelPressed,
            child: Text("Cancel", style: formActionStyle),
          ),
          SizedBox(width: 5),
          // TODO: show the exception text somewhere
          // if (state.exception != null) Text(state.exception.toString()),
          _getUpdIcon(state.upd),
          ElevatedButton(
            onPressed: state.updateAvailable() ? context.read<FormCubit<V>>().updatePressed : null,
            child: Text("Update"),
          ),
        ],
      );
    } else {
      return TextButton(
        onPressed: context.read<FormCubit<V>>().editPressed,
        child: Text(
          "Edit",
          style: formActionStyle,
        ),
      );
    }
  }

  Widget _getUpdIcon(UpdateState upd) {
    switch (upd) {
      case UpdateState.unchanged:
        return Container();
      case UpdateState.editing:
        return Container();
      case UpdateState.updating:
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ),
        );
      case UpdateState.updated:
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.check, size: 20, color: Colors.green),
        );
    }
  }
}

// TODO: add a general function for converting exceptions to user-readable text

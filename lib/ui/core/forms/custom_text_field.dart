import 'package:avencia/logic/core/cubit_form/form_cubit.dart';
import 'package:avencia/logic/core/entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../general/style.dart';

class CustomTextField<V extends Value> extends StatefulWidget {
  final String? Function(V) getValue;
  final Function(String) updValue;
  final String? label;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.getValue,
    required this.updValue,
  }) : super(key: key);

  @override
  State<CustomTextField<V>> createState() => _CustomTextFieldState<V>();
}

class _CustomTextFieldState<V extends Value> extends State<CustomTextField<V>> {
  late final TextEditingController _controller;
  @override
  void initState() {
    final currentText = _stateToText(context.read<FormCubit<V>>().state);
    _controller = TextEditingController(text: currentText);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _stateToText(FormCubitState<V> state) {
    if (state.val != null) {
      return widget.getValue(state.val!) ?? "";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormCubit<V>, FormCubitState<V>>(
      listener: (context, state) {
        final text = _stateToText(state);
        _controller.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      },
      listenWhen: (prev, curr) => _stateToText(prev) != _stateToText(curr),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: fieldFill,
          ),
          child: TextField(
            enabled: context.read<FormCubit<V>>().state.isEditing,
            controller: _controller,
            onChanged: widget.updValue,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: "Input your ${widget.label}",
              contentPadding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
              floatingLabelStyle: labelStyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

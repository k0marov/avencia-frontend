import 'package:avencia/di.dart';
import 'package:avencia/ui/features/user/kyc/uploader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/features/kyc/state_management/passport_cubit.dart';

// TODO: refactor the new features and move the general stuff to the helpers package

class PassportForm extends StatelessWidget {
  const PassportForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => uiDeps.passportCubitFactory(),
        child: BlocBuilder<PassportCubit, PassportState>(
          builder: (context, state) => Column(children: [
            const Text("Back"),
            UploaderWidget(
              state: state.back,
              onFileChosen: context.read<PassportCubit>().backUploadPressed,
            ),
            const Text("Front"),
            UploaderWidget(
              state: state.front,
              onFileChosen: context.read<PassportCubit>().frontUploadPressed,
            ),
          ]),
        ));
  }
}

import 'package:avencia/di.dart';
import 'package:avencia/logic/features/user/kyc/internal/status.dart';
import 'package:avencia/ui/features/user/kyc/uploader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../../../logic/features/user/kyc/state_management/passport_cubit.dart';

// TODO: refactor the new features and move the general stuff to the helpers package

class PassportForm extends StatelessWidget {
  const PassportForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => uiDeps.passportCubitFactory(),
        child: BlocBuilder<PassportCubit, PassportState>(
          builder: (context, state) => stateSwitch(
            state: state,
            loadedBuilder: (LoadedState loaded) => Column(children: [
              StatusWidget(status: loaded.status),
              if (loaded.status != Status.pending && loaded.status != Status.verified)
                Column(
                  children: [
                    FilesForm(state: loaded.images),
                    ElevatedButton(
                      onPressed: loaded.canBeSubmitted
                          ? context.read<PassportCubit>().submitPressed
                          : null,
                      child: Text("Submit for verification"),
                    ),
                  ],
                ),
            ]),
          ),
        ));
  }
}

class StatusWidget extends StatelessWidget {
  final Status status;
  const StatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.unset:
        return Text("Please, upload your passport photos and send them for verification.");
      case Status.pending:
        return Text("Your passport is being verified");
      case Status.verified:
        return Row(
          children: [
            Text("Your passport is verified."),
            Icon(
              Icons.done,
              color: Colors.green,
            ),
          ],
        );
      case Status.rejected:
        // TODO: maybe add a reason here
        return Text(
            "Sorry, but the passport you have submitted previously has been rejected. Please, try again.");
    }
  }
}

class FilesForm extends StatelessWidget {
  final ImagesState state;
  const FilesForm({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ]);
  }
}

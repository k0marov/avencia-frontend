import 'package:avencia/di.dart';
import 'package:avencia/logic/features/user/kyc/internal/status.dart';
import 'package:avencia/ui/features/user/kyc/uploader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../../../logic/features/user/kyc/internal/state_management/kyc_images_cubit.dart';
import '../../../../logic/features/user/kyc/internal/state_management/kyc_status_cubit.dart';

// TODO: refactor the new features and move the general stuff to the helpers package

class PassportForm extends StatelessWidget {
  const PassportForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => uiDeps.passportCubits.images()),
          BlocProvider(create: (_) => uiDeps.passportCubits.status()),
        ],
        child: BlocBuilder<KycStatusCubit, KycStatusState>(
          builder: (context, state) => stateSwitch(
            state: state,
            loadedBuilder: (Status status) => Column(children: [
              StatusWidget(status: status),
              if (status != Status.pending && status != Status.verified)
                BlocBuilder<KycImagesCubit, KycImagesState>(
                  builder: (context, images) => Column(
                    children: [
                      FilesForm(state: images),
                      ElevatedButton(
                        onPressed: context.read<KycImagesCubit>().allFilled()
                            ? context.read<KycStatusCubit>().submit
                            : null,
                        child: Text("Submit for verification"),
                      ),
                    ],
                  ),
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
        return Text(
            "Sorry, but the passport you have submitted previously has been rejected. Please, try again.");
    }
  }
}

class FilesForm extends StatelessWidget {
  final KycImagesState state;
  const FilesForm({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Back"),
      UploaderWidget(
        state: state[0],
        onFileChosen: (file) => context.read<KycImagesCubit>().upload(0, file),
      ),
      const Text("Front"),
      UploaderWidget(
        state: state[1],
        onFileChosen: (file) => context.read<KycImagesCubit>().upload(1, file),
      ),
    ]);
  }
}

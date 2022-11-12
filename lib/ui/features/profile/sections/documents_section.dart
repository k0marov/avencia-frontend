import 'package:avencia/di.dart';
import 'package:avencia/logic/features/user/kyc/internal/documents_cubit.dart';
import 'package:avencia/logic/features/user/kyc/internal/state_management/kyc_cubit.dart';
import 'package:avencia/logic/features/user/kyc/internal/status.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/icon_with_text.dart';
import '../../../core/widgets/simple_button.dart';
import '../../dashboard/section_widget.dart';

// TODO: split this file since it's too big

class DocumentsSection extends StatelessWidget {
  const DocumentsSection({Key? key}) : super(key: key);

  Widget _getDoc(DocumentsState doc) {
    switch (doc) {
      case DocumentsState.passport:
        return _Document(cubitFactory: uiDeps.passportCubitFactory, form: _PassportForm());
      case DocumentsState.nationalId:
        return _Document(cubitFactory: uiDeps.nationalIdCubitFactory, form: _NationalIdForm());
      case DocumentsState.drivingLicense:
        return _Document(
            cubitFactory: uiDeps.drivingLicenseCubitFactory, form: _DrivingLicenseForm());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Documents"),
      content: BlocProvider<DocumentsCubit>(
        create: (_) => DocumentsCubit(),
        child: BlocBuilder<DocumentsCubit, DocumentsState>(builder: (context, state) {
          print(state);
          return Column(
              key: UniqueKey(), // TODO: get rid of this dirty workaround
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _DocumentChoices(),
                _RulesReminder(),
                _getDoc(state),
              ].withSpaceBetween(height: 16));
        }),
      ),
    );
  }
}

class _Document extends StatelessWidget {
  final KycCubit Function() cubitFactory;
  final Widget form;
  const _Document({Key? key, required this.cubitFactory, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KycCubit>(
      create: (_) => cubitFactory(),
      child: BlocBuilder<KycCubit, KycState>(
        builder: (context, KycState state) => stateSwitch<Status>(
          state: state.status,
          loadedBuilder: (status) {
            switch (status) {
              case Status.unset:
                return form;
              case Status.pending:
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Thanks, your documents are being verified.",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              case Status.verified:
                return Text("The documents have been successfly verified.");
              case Status.rejected:
                return Column(children: [
                  Text("The documents were rejected."),
                  form,
                ]);
            }
          },
        ),
      ),
    );
  }
}

class _NationalIdForm extends StatelessWidget {
  const _NationalIdForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PassportForm();
  }
}

class _DrivingLicenseForm extends StatelessWidget {
  const _DrivingLicenseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PassportForm();
  }
}

class _PassportForm extends StatelessWidget {
  const _PassportForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KycCubit>();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FileUploadWidget(title: "Upload Your Front Copy", index: 0),
          _FileUploadWidget(title: "Upload Your Back Copy", index: 1),
          _Agreements(),
          GradientButton(
            content: Text("Process for Verify"),
            onPressed: () =>
                cubit.submitAllowed ? cubit.status.submit() : null, // TODO: add showing an error
          ),
          SizedBox(height: 5),
        ].withSpaceBetween(height: 16));
  }
}

class _DocumentChoices extends StatelessWidget {
  const _DocumentChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final docCubit = context.read<DocumentsCubit>();
    return Wrap(runSpacing: 8, spacing: 8, children: [
      _DocumentChoiceChip(
        label: "passport",
        selected: docCubit.state == DocumentsState.passport,
        onSelected: () => docCubit.documentChosen(DocumentsState.passport),
      ),
      _DocumentChoiceChip(
        label: "national ID",
        selected: docCubit.state == DocumentsState.nationalId,
        onSelected: () => docCubit.documentChosen(DocumentsState.nationalId),
      ),
      _DocumentChoiceChip(
        label: "driving license",
        selected: docCubit.state == DocumentsState.drivingLicense,
        onSelected: () => docCubit.documentChosen(DocumentsState.drivingLicense),
      ),
    ]);
  }
}

class _RulesReminder extends StatelessWidget {
  const _RulesReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const spacing = SizedBox(height: 15);
    return DashboardCard(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Please make sure that:", style: text.headline4),
          spacing,
          IconWithText(
            textOverflows: true,
            text: Text(
              "Chosen credential must not be expired",
              style: text.bodyText1,
            ),
            icon: Icons.done,
          ),
          spacing,
          IconWithText(
            textOverflows: true,
            icon: Icons.done,
            text: Text(
              "Document should be in good condition and be clearly visible",
              style: text.bodyText1,
            ),
          ),
          spacing,
          IconWithText(
            textOverflows: true,
            icon: Icons.done,
            text: Text(
              "There is no light glare on the card",
              style: text.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

class _FileUploadWidget extends StatelessWidget {
  final String title;
  final int index;
  const _FileUploadWidget({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final cubit = context.read<KycCubit>();
    final uploadButton = SizedBox(
      width: 150,
      child: SimpleButton(
        contents: IconWithText(
          text: Text("Upload"),
          icon: Icons.upload,
        ),
        onPressed: () => chooseImage().then(
          (img) => img != null ? cubit.images.upld(index, img) : null,
        ),
      ),
    );
    return DashboardCard(
      content: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: text.headline4),
        SizedBox(height: 5),
        Text("JPG, PNG, WEBM or PDF. Max: 6MB", style: text.bodyText1),
        SizedBox(height: 10),
        Row(
          children: [
            uploadButton,
            SizedBox(width: 16),
            cubit.state.images[index].fold(
              () => CircularProgressIndicator(),
              (some) => some.fold(
                (e) => ExceptionWidget(exception: e),
                (uploaded) => uploaded ? Icon(Icons.done, color: AppColors.green) : Container(),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class _DocumentChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function() onSelected;
  const _DocumentChoiceChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: selected
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.onSecondaryContainer,
          border: Border.all(
            color: selected ? theme.colorScheme.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: MaterialButton(
          onPressed: () => selected ? null : onSelected(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              _SimpleRadio(selected: selected),
              SizedBox(width: 6),
              Text(
                label,
                style: text.headline4?.copyWith(color: selected ? theme.colorScheme.primary : null),
              ),
            ]),
          ),
        ));
  }
}

class _SimpleRadio extends StatelessWidget {
  final bool selected;
  const _SimpleRadio({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        shape: BoxShape.circle,
        border: selected
            ? Border.all(
                color: theme.colorScheme.primary,
                width: 5,
              )
            : Border(),
      ),
    );
  }
}

class _Agreements extends StatelessWidget {
  const _Agreements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final cubit = context.read<KycCubit>();
    return Column(children: [
      Row(children: [
        Checkbox(value: cubit.state.agreements[0], onChanged: (_) => cubit.agreements.toggleOn(0)),
        Expanded(
          child: Text(
            // TODO: add a link to terms of condition and privacy policy
            "I have read Terms Of Condition and Privacy Policy",
            style: text.bodyText2,
          ),
        ),
      ]),
      SizedBox(height: 15),
      Row(children: [
        Checkbox(value: cubit.state.agreements[1], onChanged: (_) => cubit.agreements.toggleOn(1)),
        Expanded(
          child: Text(
            "All personal information I entered is correct",
            style: text.bodyText2,
          ),
        ),
      ]),
    ]);
  }
}

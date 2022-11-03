import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_card.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/dashboard/gradient_button.dart';
import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:avencia/ui/features/new/icon_text_button.dart';
import 'package:flutter/material.dart';

class DocumentsSection extends StatelessWidget {
  const DocumentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: 16);
    return DashboardSection(
      title: "Documents",
      action: Container(),
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        spacing,
        _DocumentChoices(),
        spacing,
        _RulesReminder(),
        spacing,
        _FileUploadWidget(title: "Upload Your Front Copy"),
        spacing,
        _FileUploadWidget(title: "Upload Your Back Copy"),
        spacing,
        _Agreements(),
        spacing,
        GradientButton(
          content: Text(
            "Process for Verify",
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}

class _DocumentChoices extends StatelessWidget {
  const _DocumentChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 8, spacing: 8, children: [
      _DocumentChoiceChip(
        label: "passport",
        selected: true,
        onToggle: () {},
      ),
      _DocumentChoiceChip(
        label: "national ID",
        selected: false,
        onToggle: () {},
      ),
      _DocumentChoiceChip(
        label: "driving license",
        selected: false,
        onToggle: () {},
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
        Text("Please make sure to:", style: text.headline4),
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
    ));
  }
}

class _FileUploadWidget extends StatelessWidget {
  final String title;
  const _FileUploadWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
      content: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: text.headline4),
        SizedBox(height: 5),
        Text("JPG, PNG, WEBM or PDF. Max: 6MB", style: text.bodyText1),
        SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: IconTextButton(
            iconWithText: IconWithText(
              text: Text("Upload", style: text.headline4),
              icon: Icons.upload,
            ),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}

class _DocumentChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function() onToggle;
  const _DocumentChoiceChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radioValue = 1;
    return ChoiceChip(
      label: Text(label),
      avatar: Radio(
        value: radioValue,
        groupValue: selected ? radioValue : 0,
        onChanged: (_) {},
      ),
      selected: selected,
      labelStyle: selected
          ? Theme.of(context).textTheme.button?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800,
              )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: selected ? BorderSide(color: AppColors.purple, width: 2) : BorderSide.none,
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
    return Column(children: [
      Row(children: [
        Checkbox(value: false, onChanged: (_) {}),
        Expanded(
          child: Text(
            "I have read Terms Of Condition and Privacy Policy",
            style: text.bodyText2,
          ),
        ),
      ]),
      SizedBox(height: 15),
      Row(children: [
        Checkbox(value: false, onChanged: (_) {}),
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

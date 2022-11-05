import 'package:avencia/ui/features/new/dashboard/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/widgets/dashboard_card.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/icon_with_text.dart';
import '../../../../core/widgets/simple_button.dart';

class DocumentsSection extends StatelessWidget {
  const DocumentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: 16);
    return SectionWidget(
      title: Text("Documents"),
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
          content: Text("Process for Verify"),
          onPressed: () {},
        ),
        SizedBox(height: 5),
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
      ),
    );
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
          child: SimpleButton(
            contents: IconWithText(
              text: Text("Upload"),
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
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: theme.colorScheme.onSecondaryContainer,
          border: selected
              ? Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                )
              : null,
        ),
        child: MaterialButton(
          onPressed: () {},
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
    return Column(children: [
      Row(children: [
        Checkbox(value: false, onChanged: (_) {}),
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

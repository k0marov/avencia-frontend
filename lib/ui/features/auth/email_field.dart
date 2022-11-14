import 'package:avencia/di.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/auth/email_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';

import '../../../logic/features/auth/email_field_cubit.dart';
import '../../core/widgets/simple_button.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailState = context.read<AuthStateCubit>().state!.fold(
          () => throw Exception(
              "Failed assertion of user being authenticated when viewing an EmailField widget."),
          (state) => state.emailState,
        );
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return BlocProvider<EmailFieldCubit>(
      create: (context) => EmailFieldCubit(uiDeps.authFacade, emailState),
      child: uiDeps.exceptionListener<EmailFieldCubit, EmailCubitState>(
        (s) => s.exception,
        BlocBuilder<EmailFieldCubit, EmailCubitState>(
          builder: (context, state) {
            return SimpleButton(
              borderRadius: ThemeConstants.cardBRadius,
              background: theme.colorScheme.secondaryContainer,
              onPressed: () => showEmailDialog(context),
              contents: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: text.labelMedium,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(state.current.email ?? "email"),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        state.current.isVerified ? "Verified" : "Unverified",
                        style: text.headline3?.copyWith(
                          color: state.current.isVerified ? AppColors.green : AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

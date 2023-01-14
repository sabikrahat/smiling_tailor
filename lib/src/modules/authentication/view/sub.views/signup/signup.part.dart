import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiling_tailor/src/constants/constants.dart';
import 'package:smiling_tailor/src/utils/extensions/extensions.dart';

import '../../../../../localization/loalization.dart';
import 'components/body.dart';

class SignUpPart extends ConsumerWidget {
  const SignUpPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              t!.hello,
              style: context.theme.textTheme.headline4,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              t!.registerYourselfToGetStarted,
              style: context.theme.textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: 20),
          const SignUpBody(),
        ],
      ),
    );
  }
}

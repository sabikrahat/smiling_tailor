import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../../../constants/constants.dart';
import '../../../../localization/loalization.dart';
import '../../provider/authentication.provider.dart';

class AlreadyAccountText extends ConsumerWidget {
  const AlreadyAccountText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Text.rich(
      TextSpan(
        text: t!.alreadyHaveAnAccount,
        style: context.theme.textTheme.bodyText2,
        children: [
          TextSpan(
            text: t!.loginNow,
            style: context.theme.textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => ref.read(pageControllerProvider).animateToPage(0,
                  duration: defDuration, curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }
}

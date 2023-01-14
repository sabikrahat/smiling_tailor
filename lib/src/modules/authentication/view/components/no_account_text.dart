import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import '../../../../localization/loalization.dart';

import '../../../../constants/constants.dart';
import '../../provider/authentication.provider.dart';

class NoAccountText extends ConsumerWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Text.rich(
      TextSpan(
        text: t!.dontHaveAnAccount,
        style: context.theme.textTheme.bodyText2,
        children: [
          TextSpan(
            text: t!.registerNow,
            style: context.theme.textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => ref.read(pageControllerProvider).animateToPage(1,
                  duration: defDuration, curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }
}

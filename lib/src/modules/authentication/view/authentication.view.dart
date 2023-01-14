import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiling_tailor/src/utils/extensions/extensions.dart';

import '../../../localization/loalization.dart';
import 'components/desktop.auth.view.dart';
import 'components/mobile.auth.view.dart';

class AuthenticationView extends ConsumerWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return context.screenType == ScreenType.desktop
        ? const AuthDesktopView()
        : const AuthMobileView();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiling_tailor/src/utils/extensions/extensions.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../localization/loalization.dart';
import '../../../../../../shared/keyboard/keyboard.hide.dart';
import '../../../../../../theme/themes/themes.dart';
import 'email.signup.fields.dart';
import 'phone.signup.fields.dart';

class SignUpBody extends ConsumerStatefulWidget {
  const SignUpBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends ConsumerState<SignUpBody>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return Flexible(
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Container(
            alignment: Alignment.center,
            height: 35,
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: borderRadius12,
              border: Border.all(
                color: context.theme.primaryColor,
                width: 1.0,
              ),
            ),
            child: TabBar(
              controller: tabController,
              tabs: [
                GestureDetector(
                  onTap: () {
                    hideKeyboard(context);
                    tabController!.animateTo(0);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Tab(
                    child: Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        const Icon(Icons.email_outlined, size: 18.0),
                        const SizedBox(width: 5.0),
                        Text(t!.email),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hideKeyboard(context);
                    tabController!.animateTo(1);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Tab(
                    child: Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        const Icon(Icons.phone, size: 18.0),
                        const SizedBox(width: 5.0),
                        Text(t!.phone),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                EmailSignUpFields(),
                PhoneSignUpFields(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

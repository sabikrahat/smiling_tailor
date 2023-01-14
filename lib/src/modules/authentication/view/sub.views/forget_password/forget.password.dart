import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/constants.dart';
import '../../../../../localization/loalization.dart';
import '../../../../../utils/extensions/extensions.dart';
import '../../../functions/authentication.function.dart';
import '../../../provider/authentication.provider.dart';

class ForgetPasswordPart extends ConsumerWidget {
  const ForgetPasswordPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Center(
      child: Form(
        key: ref.watch(formKeyProvider(forgotPasswordEmail)),
        child: Column(
          mainAxisSize: mainMin,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forget Password?',
                style: context.theme.textTheme.headline4,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Don\'t worry, we will help you to reset your password.',
                style: context.theme.textTheme.bodyText1,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ref.watch(emailCntrlrPd(forgotPasswordEmail)),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: t!.email,
                hintText: t!.enterEmail,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return t!.pleaseEnterEmail;
                } else if (!value.isEmail) {
                  return t!.pleaseEnterAVaildEmail;
                }
                return null;
              },
              onFieldSubmitted: (_) async => await forgotPassword(ref),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await forgotPassword(ref),
              child: const Text('Send Email'),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => ref.read(pageControllerProvider).animateToPage(0,
                  duration: defDuration, curve: Curves.easeInOut),
              child: Row(
                mainAxisSize: mainMin,
                children: [
                  Text(
                    'Go Back to Login Page',
                    style: context.theme.textTheme.bodyText2,
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.arrow_circle_right_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

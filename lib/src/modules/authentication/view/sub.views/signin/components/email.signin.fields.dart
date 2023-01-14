import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../functions/authentication.function.dart';
import '../../../../../../utils/extensions/extensions.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../localization/loalization.dart';
import '../../../../provider/authentication.provider.dart';
import '../../../components/no_account_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class EmailSignInFields extends ConsumerWidget {
  const EmailSignInFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Center(
      child: Form(
        key: ref.watch(formKeyProvider(emailSignIn)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            children: [
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(emailCntrlrPd(emailSignIn)),
                textInputAction: TextInputAction.next,
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
                onFieldSubmitted: (_) async => await signin(ref),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(pwdCntrlrPd(emailSignIn)),
                obscureText: ref.watch(isObscureProvider(loginPass)),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: t!.password,
                  hintText: t!.enterPassword,
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: InkWell(
                    onTap: () => ref
                        .read(isObscureProvider(loginPass).notifier)
                        .update((s) => !s),
                    child: Icon(
                      ref.watch(isObscureProvider(loginPass))
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return t!.pleaseEnterPassword;
                  } else if (value.length < 6) {
                    return t!.passwordMustBeAtLeast6Characters;
                  }
                  return null;
                },
                onFieldSubmitted: (_) async => await signin(ref),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => ref.read(pageControllerProvider).animateToPage(2,
                      duration: defDuration, curve: Curves.easeInOut),
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async => await signin(ref),
                child: Text(t!.login),
              ),
              const SizedBox(height: 15),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

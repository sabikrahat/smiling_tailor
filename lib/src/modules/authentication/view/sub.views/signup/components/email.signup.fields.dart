import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiling_tailor/src/modules/authentication/functions/authentication.function.dart';
import 'package:smiling_tailor/src/modules/authentication/view/components/already_account_text.dart';
import 'package:smiling_tailor/src/utils/extensions/extensions.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../localization/loalization.dart';
import '../../../../provider/authentication.provider.dart';

class EmailSignUpFields extends ConsumerWidget {
  const EmailSignUpFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Center(
      child: Form(
        key: ref.watch(formKeyProvider(emailSignUp)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            children: [
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(nameCntrlrPd(emailSignUp)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: t!.name,
                  hintText: t!.enterName,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return t!.pleaseEnterName;
                  }
                  return null;
                },
                onFieldSubmitted: (_) async => await signup(ref),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(emailCntrlrPd(emailSignUp)),
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
                onFieldSubmitted: (_) async => await signup(ref),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(pwdCntrlrPd(emailSignUp)),
                obscureText: ref.watch(isObscureProvider(registerPass)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: t!.password,
                  hintText: t!.enterPassword,
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: InkWell(
                    onTap: () => ref
                        .read(isObscureProvider(registerPass).notifier)
                        .update((s) => !s),
                    child: Icon(
                      ref.watch(isObscureProvider(registerPass))
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
                onFieldSubmitted: (_) async => await signup(ref),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(confirmPwdCntrlrPd(emailSignUp)),
                obscureText: ref.watch(isObscureProvider(registerConPass)),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: t!.confirmPassword,
                  hintText: t!.enterConfirmPassword,
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: InkWell(
                    onTap: () => ref
                        .read(isObscureProvider(registerConPass).notifier)
                        .update((s) => !s),
                    child: Icon(
                      ref.watch(isObscureProvider(registerConPass))
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
                  } else if (value != ref.watch(pwdCntrlrPd(emailSignUp)).text) {
                    return t!.passwordDoesNotMatch;
                  }
                  return null;
                },
                onFieldSubmitted: (_) async => await signup(ref),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async => await signup(ref),
                child: Text(t!.register),
              ),
              const SizedBox(height: 15),
              const AlreadyAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

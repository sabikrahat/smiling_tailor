import 'dart:math';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../functions/authentication.function.dart';
import '../../../components/already_account_text.dart';
import '../../../../../../theme/themes/themes.dart';
import '../../../../../../utils/extensions/extensions.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../localization/loalization.dart';
import '../../../../../../shared/otp_text_field/otp_field_style.dart';
import '../../../../../../shared/otp_text_field/otp_text_field.dart';
import '../../../../provider/authentication.provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class PhoneSignUpFields extends ConsumerWidget {
  const PhoneSignUpFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    return Center(
      child: Form(
        key: ref.watch(formKeyProvider(phoneSignUp)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            children: [
              const SizedBox(height: 15),
              TextFormField(
                controller: ref.watch(nameCntrlrPd(phoneSignUp)),
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
              Row(
                crossAxisAlignment: crossStart,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius12,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      child: CountryCodePicker(
                        onChanged: (v) => ref
                            .read(countryCodeProvider(phoneSignUp).notifier)
                            .update((_) => v.dialCode!),
                        enabled: !(ref.watch(showOTPScreenProvider(phoneSignUp))),
                        padding: const EdgeInsets.all(0.0),
                        showFlagMain: true,
                        searchDecoration: InputDecoration(hintText: t!.search),
                        // initialSelection: 'قطر',
                        initialSelection: 'BD',
                        favorite: const ['+880', 'BD', '+974', 'قطر'],
                        dialogBackgroundColor: context.theme.cardColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      maxLength: 10,
                      enabled: !(ref.watch(showOTPScreenProvider(phoneSignUp))),
                      controller: ref.watch(phoneCntrlrPd(phoneSignUp)),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: t!.phone,
                        hintText: t!.enterPhone,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return t!.pleaseEnterPhone;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              ref.watch(showOTPScreenProvider(phoneSignUp))
                  ? OTPTextField(
                      // autoFocus: true,
                      length: 6,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: context.theme.scaffoldBackgroundColor,
                        borderColor: context.theme.primaryColor,
                        focusBorderColor: context.theme.primaryColor,
                      ),
                      width: min(context.width, 400),
                      fieldWidth: min(context.width * 0.12, 45),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged: (v) => ref
                          .read(otpPinProvider(phoneSignUp).notifier)
                          .update((_) => v),
                      onCompleted: (_) {},
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async =>
                      ref.watch(showOTPScreenProvider(phoneSignUp))
                          ? await verifyOTPSignUp(ref)
                          : await sendOTPSignUp(ref),
                  child: Text(ref.watch(showOTPScreenProvider(phoneSignUp))
                      ? t!.verifyOTP
                      : t!.sendOTP)),
              const SizedBox(height: 15),
              const AlreadyAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

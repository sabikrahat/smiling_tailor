import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/log/log.dart';

import '../provider/authentication.provider.dart';

Future<void> signin(WidgetRef ref) async {
  if (ref.read(formKeyProvider(emailSignIn)).currentState!.validate()) {
    final email = ref.read(emailCntrlrPd(emailSignIn)).text;
    final password = ref.read(pwdCntrlrPd(emailSignIn)).text;

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Signin with email: $email and password: $password');

    return;
  }
}

Future<void> signup(WidgetRef ref) async {
  if (ref.read(formKeyProvider(emailSignUp)).currentState!.validate()) {
    final email = ref.read(emailCntrlrPd(emailSignUp)).text;
    final password = ref.read(pwdCntrlrPd(emailSignUp)).text;

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Signup with email: $email and password: $password');

    return;
  }
}

Future<void> forgotPassword(WidgetRef ref) async {
  if (ref.read(formKeyProvider(forgotPasswordEmail)).currentState!.validate()) {
    final email = ref.read(emailCntrlrPd(forgotPasswordEmail)).text;

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Forgot password with email: $email');

    return;
  }
}

Future<void> sendOTPSignIn(WidgetRef ref) async {
  if (ref.read(formKeyProvider(phoneSignIn)).currentState!.validate()) {
    final countryCode = ref.read(countryCodeProvider(phoneSignIn));
    final phoneNumber = ref.read(phoneCntrlrPd(phoneSignIn)).text;

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Send OTP with phone number: $countryCode$phoneNumber');

    ref.read(showOTPScreenProvider(phoneSignIn).notifier).update((s) => !s);

    return;
  }
}

Future<void> sendOTPSignUp(WidgetRef ref) async {
  if (ref.read(formKeyProvider(phoneSignUp)).currentState!.validate()) {
    final name = ref.read(nameCntrlrPd(phoneSignUp)).text;
    final countryCode = ref.read(countryCodeProvider(phoneSignUp));
    final phoneNumber = ref.read(phoneCntrlrPd(phoneSignUp)).text;

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Send OTP with phone number: $countryCode$phoneNumber and name $name');

    ref.read(showOTPScreenProvider(phoneSignUp).notifier).update((s) => !s);

    return;
  }
}

Future<void> verifyOTPSignIn(WidgetRef ref) async {
  if (ref.read(formKeyProvider(phoneSignIn)).currentState!.validate()) {
    final countryCode = ref.read(countryCodeProvider(phoneSignIn));
    final phoneNumber = ref.read(phoneCntrlrPd(phoneSignIn)).text;

    final otpPin = ref.read(otpPinProvider(phoneSignIn));

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Verify OTP with phone number: $countryCode$phoneNumber and OTP: $otpPin');

    ref.read(showOTPScreenProvider(phoneSignIn).notifier).update((s) => !s);

    return;
  }
}

Future<void> verifyOTPSignUp(WidgetRef ref) async {
  if (ref.read(formKeyProvider(phoneSignUp)).currentState!.validate()) {
    final name = ref.read(nameCntrlrPd(phoneSignUp)).text;
    final countryCode = ref.read(countryCodeProvider(phoneSignUp));
    final phoneNumber = ref.read(phoneCntrlrPd(phoneSignUp)).text;

    final otpPin = ref.read(otpPinProvider(phoneSignUp));

    await Future.delayed(const Duration(seconds: 1));

    log.i('>>> Verify OTP with phone number: $countryCode$phoneNumber, OTP: $otpPin and name $name');

    ref.read(showOTPScreenProvider(phoneSignUp).notifier).update((s) => !s);

    return;
  }
}

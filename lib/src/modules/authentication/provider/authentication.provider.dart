import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int loginPass = 0;
const int registerPass = 1;
const int registerConPass = 2;
//
const int emailSignIn = 0;
const int phoneSignIn = 1;
const int emailSignUp = 2;
const int phoneSignUp = 3;
const int forgotPasswordEmail = 4;
//

final pageControllerProvider = Provider.autoDispose((ref) {
  ref.keepAlive();
  return PageController();
});

final formKeyProvider = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  return GlobalKey<FormState>();
});

final countryCodeProvider = StateProvider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  return '+880';
});

final otpPinProvider = StateProvider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  return '';
});

final showOTPScreenProvider =
    StateProvider.family((_, int __) => false);

final isObscureProvider = StateProvider.autoDispose.family((_, int __) => true);

final emailCntrlrPd = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final pwdCntrlrPd = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final confirmPwdCntrlrPd = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final nameCntrlrPd = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

final phoneCntrlrPd = Provider.autoDispose.family((ref, int _) {
  // ref.keepAlive();
  final cntrlr = TextEditingController();

  ref.onDispose(() => cntrlr.dispose());

  return cntrlr;
});

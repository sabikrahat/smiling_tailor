import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/authentication.provider.dart';
import '../sub.views/forget_password/forget.password.dart';
import '../sub.views/signin/signin.part.dart';
import '../sub.views/signup/signup.part.dart';

class AuthPart extends ConsumerWidget {
  const AuthPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 30.0, 15.0),
      child: PageView(
        controller: ref.watch(pageControllerProvider),
        physics: const NeverScrollableScrollPhysics(),
        children: const [SignInPart(), SignUpPart(), ForgetPasswordPart()],
      ),
    );
  }
}

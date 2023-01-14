import 'package:flutter/material.dart';
import 'auth.part.dart';
import '../../../../utils/extensions/extensions.dart';

import '../../../../shared/footer/custom.footer.dart';

class AuthMobileView extends StatelessWidget {
  const AuthMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Container(
        width: context.width,
        height: context.height * 0.35,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: Container(
        width: context.width,
        height: context.height * 0.65,
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: context.theme.primaryColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: const [
            Flexible(
              child: AuthPart(),
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }
}

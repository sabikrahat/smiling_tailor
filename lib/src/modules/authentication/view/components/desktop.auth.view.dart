import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../utils/extensions/extensions.dart';

import '../../../../shared/footer/custom.footer.dart';
import '../../../../theme/themes/themes.dart';
import 'auth.part.dart';

class AuthDesktopView extends StatelessWidget {
  const AuthDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          width: min(context.width, 1200.0),
          height: context.height * 0.7,
          child: Card(
            shape: roundedRectangleBorder20,
            color: Colors.transparent,
            elevation: 5.0,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: borderRadius20,
                boxShadow: [
                  BoxShadow(
                    color: context.theme.primaryColor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child: AuthPart(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/auth.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(350.0),
                              bottomLeft: Radius.circular(350.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomFooter(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

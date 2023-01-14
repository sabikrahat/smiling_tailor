import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Colors,
        Column,
        FontWeight,
        MediaQuery,
        Scaffold,
        SingleChildScrollView,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';
import '../beamer/beamer_history.dart';

class KPageNotFound extends StatelessWidget {
  const KPageNotFound({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    printUrlHistory(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            mainAxisAlignment: mainCenter,
            children: [
              SvgPicture.asset(
                'assets/svgs/error.svg',
                height: size.width * 0.35,
                width: size.width * 0.35,
              ),
              Text(
                'Error: $error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/extensions/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Developed by ',
            style: context.theme.textTheme.bodyText2,
          ),
          InkWell(
            onTap: () async => await canLaunchUrl(
                    Uri.parse('https://algoramming.github.io/'))
                ? await launchUrl(Uri.parse('https://algoramming.github.io/'))
                : throw 'Could not launch the url',
            child: Text(
              'Algoramming',
              style: context.theme.textTheme.bodyText2!.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // const Text(
          //   ' in 💙 with ',
          //   style: TextStyle(
          //     fontSize: 13,
          //     fontWeight: FontWeight.w500,
          //     color: Colors.black,
          //   ),
          // ),
          // InkWell(
          //   onTap: () async =>
          //       await canLaunchUrl(Uri.parse('https://flutter.dev/'))
          //           ? await launchUrl(Uri.parse('https://flutter.dev/'))
          //           : throw 'Could not launch the url',
          //   child: Text(
          //     'Flutter',
          //     style: TextStyle(
          //       fontSize: 13,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.blue[700],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

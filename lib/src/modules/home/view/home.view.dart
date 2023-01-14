import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../../app_routes.dart';
import '../../../constants/constants.dart';
import '../../../localization/loalization.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: mainMin,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Test',
                  hintText: 'For testing purpose...',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                child: ListTile(
                  title: Text(t!.setting),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () =>
                      Beamer.of(context).beamToNamed(AppRoutes.settingsRoute),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () =>
                    Beamer.of(context).beamToNamed(AppRoutes.authRoute),
                child: const Text('Authentication'),
              ),
              const SizedBox(height: 10.0),
              OutlinedButton(
                onPressed: () =>
                    Beamer.of(context).beamToNamed(AppRoutes.settingsRoute),
                child: const Text('Settings'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Beamer.of(context).beamToNamed(AppRoutes.settingsRoute),
        child: const Icon(Icons.settings),
      ),
    );
  }
}

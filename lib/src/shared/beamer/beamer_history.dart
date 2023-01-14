import 'package:beamer/beamer.dart' show Beamer;
import 'package:flutter/cupertino.dart' show BuildContext;

import '../../utils/log/log.dart';


void printUrlHistory(BuildContext context) => log.i(
    'History: ${Beamer.of(context).beamingHistory.map((e) => e.history.map((v) => v.routeInformation.location)).toList()}');

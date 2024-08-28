import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/app/flavors.dart';

void main() {
  AppFlavor.appFlavor = FlavorStatus.production;
  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:unicode_test_app/core/app/flavors.dart';

import 'core/app/app.dart';

void main() {
  AppFlavor.appFlavor = FlavorStatus.development;
  runApp(const App());
}

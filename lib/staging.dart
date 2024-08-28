import 'package:flutter/material.dart';
import 'package:unicode_test_app/core/app/app.dart';

import 'core/app/flavors.dart';

void main() {
  AppFlavor.appFlavor = FlavorStatus.staging;
  runApp(const App());
}

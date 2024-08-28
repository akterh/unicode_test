import 'package:flutter/material.dart';
import 'package:unicode_test_app/core/app/flavors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppFlavor.getFlavor == FlavorStatus.development
            ? "Development"
            : AppFlavor.getFlavor == FlavorStatus.staging
                ? "Staging"
                : "Production"),
      ),
    );
  }
}

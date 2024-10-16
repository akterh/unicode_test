import 'package:flutter/material.dart';
import 'package:unicode_test_app/core/app/flavors.dart';

import '../../features/screens/product/view/product_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${AppFlavor.getFlavor}',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:try_your_luck/screens/home.dart';

void main() {
  runApp(const TryYourLuck());
}

class TryYourLuck extends StatelessWidget {
  const TryYourLuck({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

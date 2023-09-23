import 'package:flutter/material.dart';
import 'package:untitled14/vibrator.dart';

void main() => runApp(const VibratingApp());

class VibratingApp extends StatelessWidget {
  const VibratingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VibratorScreen(),
    );
  }
}

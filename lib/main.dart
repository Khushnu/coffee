import 'package:coffee/Screens/logincoffee_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
double screenHeight = 0;
double screenWidth = 0;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginCoffeeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_3/CurrencyConverter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Return Type of this is will be widget
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: CurrencyConverter());
  }
}

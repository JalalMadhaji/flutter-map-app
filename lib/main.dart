import 'package:flutter/material.dart';
import 'package:flutter_map_app/ui/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "expo",
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

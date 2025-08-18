import 'package:flutter/material.dart';
import 'package:todo_list/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Opcional, para Material 3
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

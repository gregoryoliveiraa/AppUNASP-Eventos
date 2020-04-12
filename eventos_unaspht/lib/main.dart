import 'package:eventos_unaspht/app/app_module.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventos Unasp-HT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppModule(),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_unaspht/app/app_module.dart';
import 'package:flutter/material.dart';

void main() async{ 
  runApp(MyApp());

var db = Firestore.instance;

  db.collection("eventos").snapshots().listen((resultado) {
    resultado.documents.forEach((d)
    {
      print(d.data);
    }); 

              // QuerySnapshot resultado = await db.collection("eventos").getDocuments();
              // resultado.documents.forEach((d){
              //   print(d.documentID);
              //   print(d.data);

  });
}


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
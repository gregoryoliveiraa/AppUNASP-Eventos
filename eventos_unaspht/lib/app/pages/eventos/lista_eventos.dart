import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_unaspht/app/pages/login/models/event_model.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/material.dart';

class ListaEventos extends StatefulWidget {
  @override
  _ListaEventosState createState() => _ListaEventosState();  
}

class _ListaEventosState extends State<ListaEventos> {

  List<EventModel> items;
  var db = Firestore.instance;  
  StreamSubscription<QuerySnapshot> eventoInscricao;
  
  @override
  void initState() {
    super.initState();

    items = List();
    eventoInscricao?.cancel();// SE HOUVER INSCRIÇÃO EM ANDAMENTO É CANCELADO ANTES DE LISTAR
    eventoInscricao = db.collection("eventos").snapshots().listen((resultado) {
      final List <EventModel> listaEventos = resultado.documents.map(
        (documentSnapshot) => EventModel.fromMap(
          documentSnapshot.data, documentSnapshot.documentID),).toList();
          
          setState(() {
            this.items = listaEventos;
            print(listaEventos);
          });
    });
  }

  @override
  void dispose() {
    eventoInscricao?.cancel(); //DESESCREVE DO STREMMING PRA LIBERAR O RECURSO
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(title: Text("LISTA EVENTOS"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder <QuerySnapshot> (
              stream : getListaEventos(),
              builder : (context, snapshot) {
                switch(snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(), // PROCESSAMENTO EM EXECUÇÃO
                    );
                default: 
                  List<DocumentSnapshot> documentos = snapshot.data.documents;

                  return ListView.builder( // LISTVIEW PARA RETORNAR OS DOCUMENTOS 
                    itemCount: documentos.length,
                    itemBuilder: (context, index ) {
                      return ListTile( //INFORMAÇÕES DO DOCUMENTO
                        title: Text(items[index].titulo, style: TextStyle(fontSize: 22)),
                        subtitle: Text(items[index].local, style: TextStyle(fontSize: 22)),
                        leading: Column(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                
                                _showAlertDialog(context);
                                _deletaEvento(context, documentos[index], index);
                              }
                            )
                          ],
                        ),  
                      );
                    },
                  );
                }
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ORANGE,
        onPressed: () {},
      ),
    );
  }

  Stream<QuerySnapshot> getListaEventos() {
    return Firestore.instance.collection('eventos').snapshots();  
  }

  void _deletaEvento(
    BuildContext context, 
    DocumentSnapshot doc, 
    int position
  ) async{ // INSTANCIA FIRESTORE
    db.collection("eventos").document(doc.documentID).delete();

    setState(() {
      items.removeAt(position);
    });
  }

  _showAlertDialog(BuildContext context) {
   Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {},
  );
  Widget continuaButton = FlatButton(
    child: Text("Continuar"),
    onPressed:  () {},
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Deseja continuar aprendendo Flutter ?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




}

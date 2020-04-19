import 'package:eventos_unaspht/app/pages/eventos/event_list.dart';
import 'package:eventos_unaspht/app/pages/home/components/square_home_button.dart';
import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<bool>(builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("EVENT PAGE".toUpperCase()),
          leading: snapshot.hasData && snapshot.data
              ? Container()
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
                  },
                ),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Preencha os campos abaixo!".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor, 
                fontSize: 18)
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SquareHomeButton("Cadastrar Evento", Colors.grey,
                      FontAwesomeIcons.userEdit, context,
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => EventList()));
                      },
                  ),
                  SquareHomeButton("Listar Eventos", Colors.grey,
                      FontAwesomeIcons.list, context),
                  SquareHomeButton("Editar Eventos", Colors.grey,
                      FontAwesomeIcons.edit, context)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    elevation: 10,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    textColor: Colors.black87,
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => EventList()));
                    },
                    child: new Text("Add Fotos",
                    style: TextStyle(
                      color: Colors.black87, 
                      fontSize: 18,
                    )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

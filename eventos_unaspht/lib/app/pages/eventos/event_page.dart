import 'package:eventos_unaspht/app/pages/eventos/event_list.dart';
import 'package:eventos_unaspht/app/pages/home/components/square_home_button.dart';
import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'event_images.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(    
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Flexo',secondaryHeaderColor: ORANGE,primaryColor: BLUE),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: BLUE,
          centerTitle: true,
          title: Text('EVENT PAGE'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())); 
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),          
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey[300],
              onPressed: () {}
            ),
          ],
        ),

/*_BODY____________________________________________________________________ */
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 44.0),
                    textColor: Colors.black87,
                    color: Colors.grey,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),),
                      onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => EventImages()));
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
      ),
    );
  }
}

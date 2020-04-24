import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/eventos/event_list.dart';
import 'package:eventos_unaspht/app/pages/eventos/event_page.dart';
import 'package:eventos_unaspht/app/pages/home/about.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app_module.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Flexo',secondaryHeaderColor: ORANGE,primaryColor: BLUE),
      home: new Scaffold(
      appBar: AppBar(
        backgroundColor: BLUE,
        centerTitle: true,
        title: Text("HOME PAGE".toUpperCase()),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey[300],
              onPressed: () {} // CRIAR POPUP DE PESQUISA
              ),
        ],
      ),


/*_____MENU LATERAL________________________________________________________________________________*/
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Marcelo",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                  fontSize: 20)),
              accountEmail: Text("marcelo@gmail.com", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                  fontSize: 18)),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),

            InkWell(              
              child: ListTile(
                title: Text('Sair'.toUpperCase(), style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.home, size: 35,),
                trailing: Icon(Icons.arrow_forward, size: 25,),
              ),
              onTap: () {
                _confirmaSair();
              },
            ),

            InkWell(
              child: ListTile(
                title: Text("Perfil", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.person, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            InkWell(              
              child: ListTile(
                title: Text('Eventos', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.event, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EventPage()));
              },
            ),

            InkWell(
              child: ListTile(
                title: Text('Sobre', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.help,color: ORANGE, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => About()));
              },
            ),
          ],
        ),
      ),

/*_____BODY________________________________________________________________________________*/
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.event_available, size: 40.0,),
                    color: Colors.grey[600],
                    tooltip: 'Cadastrar Evento',
                    focusColor: Colors.orange[900],
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EventPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.view_list, size: 40.0, semanticLabel: "Listar",),
                    color: Colors.grey[600],
                    tooltip: 'Listar Eventos',
                    focusColor: Colors.orange[900],
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EventList()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Text("próximos eventos".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: BLUE,
                      fontSize: 18
                  )
              ),
              SizedBox(height: 10,),
              _news(context),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),

/*_____MENU INFERIOR________________________________________________________________________________*/      
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 1,
        tabs: [
          
          TabData(iconData: FontAwesomeIcons.userAlt,
            title: "PERFIL",
          ),

          TabData(iconData: FontAwesomeIcons.home,
            title: "HOME",
            onclick: _home,
          ),

          TabData(iconData: FontAwesomeIcons.cog, 
            title: "AJUSTES",
          ),

          TabData(iconData: FontAwesomeIcons.calendarCheck, 
            title: "EVENTOS",
            onclick: _evento,
          ),
        ],
        circleColor: ORANGE,
        inactiveIconColor: ORANGE,
        onTabChangedListener: (position) {
          setState(() {});
        },
      ),
    ),
    );
  }

/*_____CARROSEL________________________________________________________________________________*/
  Widget _news(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      enableInfiniteScroll: false,
      height: appWidth * .8,
      items: [1, 2, 3, 4, 5, 6].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[900],
                          blurRadius:
                              7.0, // has the effect of softening the shadow
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/img/test.png", fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: appWidth * .01,
                              ),
                              Text("semana da arte".toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: appWidth * .01,
                              ),
                              Text("Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54),
                              ),
                              SizedBox(height: appWidth * .01,
                              ),
                              Text("Data: 11/11/1111",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13, color: Colors.black),
                              ),
                              SizedBox(height: appWidth * .01,
                              ),
                              Text("Local: Arlete Afonso",
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style:
                                    TextStyle(fontSize: 13, color: Colors.red),
                              ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }

  _home() {
    Navigator.of(context).pop();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AppModule()));
  }

  _evento() {
    Navigator.of(context).pop();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => EventList()));
  }

  _confirmaSair() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text("Deseja Sair?",
                textAlign: TextAlign.center,
                style: TextStyle( color: ORANGE,
                  fontSize: 20,
                ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey[300],
                    child: Text('SIM',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => AppModule()));
                    }
                  ),
                  FlatButton(
                    color: Colors.grey[300],
                    child: Text('NÃO',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                    }
                  )
                ]
              )
            ],
          ),
        );
      }    
    );
  }




  //       return AlertDialog(
  //         content: Text("Deseja realmente Sair?", textAlign: TextAlign.center,),
  //         actions: <Widget>[
  //           SizedBox(height: 30),
  //           new RaisedButton(
  //             child: Text("SIM"),
  //             onPressed: (){
  //               Navigator.of(context).pop();
  //               Navigator.of(context).push(MaterialPageRoute(
  //                 builder: (BuildContext context) => AppModule()));
  //           }),
  //           new RaisedButton(
  //             child: Text("NÃO"),
  //             onPressed: (){
  //               Navigator.of(context).pop();
  //           }),
  //         ],
  //       );
  //     }    
  //   );
  // }





}

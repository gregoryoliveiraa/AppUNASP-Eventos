import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/eventos/event_list.dart';
import 'package:eventos_unaspht/app/pages/eventos/event_page.dart';
import 'package:eventos_unaspht/app/pages/sobre/sobreAppUnasp.dart';
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
    Color orange = Theme.of(context).secondaryHeaderColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HOME PAGE".toUpperCase()),
        actions: <Widget>[
          new IconButton(
              icon: Icon(FontAwesomeIcons.search),
              color: Colors.grey[300],
              onPressed: () {} // CRIAR POPUP DE PESQUISA
              ),
        ],
      ),

//GRELHA
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
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
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AppModule()));
              },
              child: ListTile(
                title: Text('Sair'.toUpperCase(), style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.home, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AppModule()));
              },
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
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EventList()));
              },
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
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AppModule()));
              },
              child: ListTile(
                title: Text('Ajustes', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.settings, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SobreAppUnasp()));
              },
              child: ListTile(
                title: Text('Sobre', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 18)),
                leading: Icon(Icons.help,color: orange, size: 35,),
                trailing: Icon(Icons.arrow_forward,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),

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
                      Icons.event_available, size: 40.0,semanticLabel: "Cadastrar",),
                    color: Colors.grey[600],
                    tooltip: 'Cadastrar Evento',
                    focusColor: Colors.orange,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EventPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.view_list, size: 40.0, semanticLabel: "Listar",),
                    color: Colors.grey[600],
                    tooltip: 'Listar Eventos',
                    focusColor: Colors.green,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EventList()));
                    },
                  ),
                ],
              ),

              // Row(mainAxisAlignment:
              // MainAxisAlignment.spaceEvenly,children: <Widget>[
              //   SquareHomeButton("Cadastrar Evento", Colors.grey,
              //     FontAwesomeIcons.userEdit, context),
              //   SquareHomeButton("Listar Eventos", Colors.grey,
              //     FontAwesomeIcons.list, context),
              //   SquareHomeButton("Editar Eventos", Colors.grey,
              //     FontAwesomeIcons.edit, context)
              // ],
              // ),
              SizedBox(
                height: 160,
              ),
              Text("próximos eventos".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 18)),
              SizedBox(
                height: 10,
              ),
              _news(context),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
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
        circleColor: orange,
        inactiveIconColor: orange,
        onTabChangedListener: (position) {
          setState(() {});
        },
      ),
    );
  }

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
        MaterialPageRoute(builder: (BuildContext context) => EventPage()));
  }

}

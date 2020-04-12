import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/login/signin/signin_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/square_home_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    //Color BLUE = Theme.of(context).primaryColor;
    //double appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Eventos Unasp - HT".toUpperCase()),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.powerOff), 
          onPressed: () { // SAIR DA HOMEAPGE
          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
          }
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,children: <Widget>[
                SquareHomeButton("Cadastrar Evento", Colors.grey,
                  FontAwesomeIcons.userEdit, context), 
                 



                  
                  
                SquareHomeButton("Listar Eventos", Colors.grey,
                  FontAwesomeIcons.list, context),
                SquareHomeButton("Editar Eventos", Colors.grey,
                  FontAwesomeIcons.edit, context)
              ],
              ),
              SizedBox(height: 40,),
              Text("próximos eventos".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
                fontSize: 18)),
              SizedBox(height: 10,),
              _news(context),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 1, tabs: [
          TabData(iconData: FontAwesomeIcons.userAlt, title: "PERFIL"),
          TabData(iconData: FontAwesomeIcons.home, title: "HOME"),
          TabData(iconData: FontAwesomeIcons.cog, title: "AJUSTES"),
          TabData(iconData: FontAwesomeIcons.calendarCheck, title: "EVENTOS")
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
                          blurRadius: 7.0, // has the effect of softening the shadow
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/img/test.png",
                      fit: BoxFit.cover),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: appWidth * .01,),
                              Text("semana da arte".toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  fontSize: 14,),
                              ),
                              SizedBox(height: appWidth * .01,),
                              Text("Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: Colors.black54),
                              ),
                              SizedBox(height: appWidth * .01,),
                              Text("Data: 11/11/1111",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: Colors.black),
                              ),
                              SizedBox(height: appWidth * .01,),
                              Text("Local: Arlete Afonso",
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: Colors.red),
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
}
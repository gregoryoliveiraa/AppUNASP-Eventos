
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/material.dart';

class SobreAppUnasp extends StatefulWidget {
  @override
  _SobreAppUnaspState createState() => _SobreAppUnaspState();
}

class _SobreAppUnaspState extends State<SobreAppUnasp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o  APP"),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Center(
        //   height: MediaQuery
        //   .of(context)
        //   .size
        //   .height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
              ],
              ),
              // Text("Aplicativo do Unasp para voçê".toUpperCase(),
              // textAlign: TextAlign.center,
              // style: TextStyle(
              //   fontWeight: FontWeight.bold, 
              //   color: Theme.of(context).primaryColor,
              //   fontSize: 18)
              // ),
              SizedBox(height: 20,),
              _news(context),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return, size: 40),
        backgroundColor: ORANGE,
        onPressed: (){
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        },
      ),
    );
  }
   
    Widget _news(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      enableInfiniteScroll: false,
      height: appWidth * 1.4,
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: 2, bottom: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[900],
                          blurRadius: 7.0,
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: appWidth * .05,),
                      //Image.asset("assets/img/igreja.png",
                      //fit: BoxFit.fill),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
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
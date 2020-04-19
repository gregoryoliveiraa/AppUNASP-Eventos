import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EventImages extends StatefulWidget {
  @override
  _EventImagesState createState() => _EventImagesState();
}

class _EventImagesState extends State<EventImages> {
  List<Asset> _images = List<Asset>();

@override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Fotos dos Eventos".toUpperCase()),
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.signOutAlt),
// SAIR DA HOMEAPGE
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
        ),
        body: Column(
          children: <Widget>[
            // const SizedBox(
            //   height: 10,
            // ),
            // // Center(
            // //     child: Text(
            //   'LOG: $_error',
            //   style: TextStyle(fontSize: 22),
            // )),
            const SizedBox(
              height: 5,
            ),
            RaisedButton(
              child: Text("ADD Fotos"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
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
    );
}

 Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(.0),
      //padding: EdgeInsets.only(top: 5, bottom: 50,),
      children: List.generate(_images.length, (index) {
        Asset asset = _images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    //função que popula as fotos
    // if (!await Permission.camera.request().isGranted) {
    //   setState(() {
    //     _error = "Permissão não garantida!";
    //   });
    //   return;
    // }

    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10, // seleção maxima
        enableCamera: true,
        selectedAssets: _images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "ImageX",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#ffffff",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      _images = resultList;
      error = error;
    });
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
                              SizedBox(
                                height: appWidth * .01,
                              ),
                              Text("semana da arte".toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: appWidth * .01,
                              ),
                              Text(
                                "Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54),
                              ),
                              SizedBox(
                                height: appWidth * .01,
                              ),
                              Text(
                                "Data: 11/11/1111",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              SizedBox(
                                height: appWidth * .01,
                              ),
                              Text(
                                "Local: Arlete Afonso",
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
}

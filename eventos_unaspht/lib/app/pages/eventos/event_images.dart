import 'package:eventos_unaspht/app/pages/eventos/event_page.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Flexo',secondaryHeaderColor: ORANGE,primaryColor: BLUE),
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: BLUE,
          centerTitle: true,
          title: Text("EVENT IMAGES".toUpperCase()),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventPage()));
              }),
        ),
        body: Column(
          children: <Widget>[
            new Container(
             padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
          ),
            const SizedBox(height: 20,),
            RaisedButton(              
              elevation: 10,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 44.0),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),),
              child: Text("ADD Fotos",
                style: TextStyle(
                  color: Colors.black87, 
                  fontSize: 18,
                ),
              ),
              onPressed: loadAssets,
            ),
            SizedBox(height: 30,),
            Expanded(child: buildGridView(),),
          ],
        ),
      ),
    );
}

 Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(.50),
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
  


}

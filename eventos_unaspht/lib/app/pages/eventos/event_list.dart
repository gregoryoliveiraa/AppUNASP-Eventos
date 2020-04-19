import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("EVENT LIST".toUpperCase()),
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
        body: Column(
          children: <Widget>[],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.keyboard_return, size: 40),
        //   backgroundColor: Colors.green,
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (BuildContext context) => HomePage()));
        //   },
        // ),
      );
    });
  }
}

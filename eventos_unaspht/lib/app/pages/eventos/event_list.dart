import 'package:eventos_unaspht/app/pages/home/home_page.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/material.dart';


class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(/*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [/*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Semana de Oração',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('Palestrante: Alejandro Bullon',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.favorite,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

   Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Flexo',secondaryHeaderColor: ORANGE,primaryColor: BLUE),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('EVENT LIST'),
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
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: [
            Image.asset('assets/img/lake.png',
              width: 600,
              height: 240,
              fit: BoxFit.fitWidth,
            ),
            titleSection,
            textSection,
          ],
        ),
      ),
    );
  }

}

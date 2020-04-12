import 'package:flutter/material.dart';

class SquareHomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final BuildContext context;

  SquareHomeButton(this.text, this.color, this.icon, this.context, {Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[900],
              blurRadius: 7.0, // has the effect of softening the shadow
            )
          ]),
      width: appWidth * .3,
      height: appWidth * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(color: color),
            child: Icon(icon),
          ),
          SizedBox(height: 15,),
          Text(text.toUpperCase(),
          textAlign: TextAlign.center,
          
          )
        ],
      ),
    );
  }
}

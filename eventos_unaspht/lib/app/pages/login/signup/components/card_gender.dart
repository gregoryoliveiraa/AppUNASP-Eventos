import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CardGender extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool disabled;
  final bool horizontal;

  const CardGender(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.isSelected,
      this.horizontal = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: disabled ? Colors.grey[400] : Colors.grey[200],
      child: Container(
        width: horizontal ? 
        MediaQuery.of(context).size.width * .9 : //COMPRIMENTO CAMPO 
        MediaQuery.of(context).size.width * .39, // LARGURA ESCOLARIDADE
        height: horizontal ? 60 : // TAMANHO CAMPO COLUNAS
        MediaQuery.of(context).size.width / 3.8,
        padding: EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Center(
              child: horizontal ?
// taamnho da linha              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: isSelected ? 
                    Theme.of(context).primaryColor: Colors.grey,
                    size: 30, // TAMANHO DO ICONE 
                  ),
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected ? 
                      Theme.of(context).primaryColor: 
                      Colors.grey,
                      fontSize: 18),
                        )
                      ],
              )
// tamanho das colunas
              :Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    icon,
                    color: isSelected ? 
                    Theme.of(context).primaryColor : Colors.grey,
                    size: 55, // TAMANHO ICONE gender_step
                  ),
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: isSelected ? 
                    Theme.of(context).primaryColor: Colors.grey,
                    fontSize: 14),
                  )
                ],
              ),
            ),
            isSelected
                ? Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      FontAwesomeIcons.solidCheckCircle,
                      color: Colors.green,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

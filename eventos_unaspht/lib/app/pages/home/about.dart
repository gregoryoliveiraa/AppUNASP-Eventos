import 'package:eventos_unaspht/app/shared/defaults.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {return true; },
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: ListView(
              children: <Widget>[
                Center(
                  child: Image.asset('assets/img/logo_branco.png',
                    height: 230.0,
      
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(sobreApp,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(25.0),
                  child: Center(
                    child: new RichText(
                      text: new TextSpan(
                        children: [
                          TextSpan(
                            text: 'Made with ',
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                          WidgetSpan(
                            child: FlutterLogo(size: 24.0),
                          ),
                          TextSpan(
                            text: ' Flutter & ❤️ ',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 250.0, 35.0, 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SocialMediaCard(
                        onPressed: (){},
                        iconData: FontAwesomeIcons.facebookSquare,
                      ),
                      SocialMediaCard(
                        onPressed: () {},
                        iconData: FontAwesomeIcons.google,
                      ),
                      SocialMediaCard(
                        onPressed: () {},
                        iconData: FontAwesomeIcons.instagram,
                      ),
                      SocialMediaCard(
                        onPressed: () {},
                        iconData: FontAwesomeIcons.twitter,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          );
        }    
        
}

class SocialMediaCard extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const SocialMediaCard({Key key, this.onPressed, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
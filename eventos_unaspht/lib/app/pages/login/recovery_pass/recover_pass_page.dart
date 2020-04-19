import 'package:eventos_unaspht/app/app_module.dart';
import 'package:eventos_unaspht/app/pages/home/home_module.dart';
//import 'package:eventos_unaspht/app/pages/login/recovery_pass/recover_pass_bloc.dart';
import 'package:eventos_unaspht/app/shared/components/button.dart';
import 'package:eventos_unaspht/app/shared/components/text.field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecoverPassPage extends StatefulWidget {
  @override
  _RecoverPassPageState createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    return StreamBuilder<bool>(builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ESQUECI MINHA SENHA".toUpperCase()),
          leading: snapshot.hasData && snapshot.data
              ? Container()
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AppModule()));
                  },
                ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              CustomTextField(
                hintText: "Digite seu E-mail",
                icon: FontAwesomeIcons.solidEnvelope,
                isPassword: false,
                isBlue: false,
                inputType: TextInputType.emailAddress,
                controller: null,
              ),
              SizedBox(height: 20),
              Button(
                  context: context,
                  color: orange,
                  text: "enviar",
                  onTap: () {
                    CupertinoPageRoute(builder: (context) => HomeModule());
                  }),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:eventos_unaspht/app/pages/login/signup/login_module.dart';
import 'package:eventos_unaspht/app/pages/login/signup/signup_bloc.dart';
import 'package:eventos_unaspht/app/shared/components/button.dart';
import 'package:eventos_unaspht/app/shared/components/text.field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InicioEvento extends StatefulWidget {
  @override
  _InicioEventoState createState() => _InicioEventoState();
}

class _InicioEventoState extends State<InicioEvento> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text("Preencha os campos abaixo!".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18)
            ),
            SizedBox(height: 20,),
            CustomTextField(
              controller: signupBloc.nameController,
              isBlue: false,
              onChanged: signupBloc.isValidBasicForm,
              icon: FontAwesomeIcons.userAlt,
              hintText: "Título do Evento:",
              isPassword: false,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: signupBloc.emailController,
              isBlue: false,
              icon: FontAwesomeIcons.solidEnvelope,
              hintText: "Local:",
              onChanged: signupBloc.isValidBasicForm,
              isPassword: false,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            CustomTextField(
              onChanged: signupBloc.isValidBasicForm,
              controller: signupBloc.passController,
              isBlue: false,
              icon: FontAwesomeIcons.lock,
              hintText: "Hora Iício",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: signupBloc.passconfirmController,
              isBlue: false,
              onChanged: signupBloc.isValidBasicForm,
              icon: FontAwesomeIcons.lock,
              hintText: "Hora Término",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            StreamBuilder<bool>(
                stream: signupBloc.isValidBasicController,
                builder: (context, snapshot) {
                  return Button(
                      enabled: snapshot.hasData && snapshot.data,
                      color: orange,
                      onTap: () {
                        signupBloc.pageController.nextPage(
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 100));
                      },
                      context: context,
                      text: "Continuar");
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nome completo",
              ),
              keyboardType: TextInputType.text,
              validator: (text) {
                if (text.isEmpty) return "Nome completo é obrigatório";
                return "";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return "E-mail inválido";
                return "";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              key: passKey,
              decoration: InputDecoration(hintText: "Senha"),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Senha inválida";
                return "";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Confirme a senha"),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (text) {
                if (text.isEmpty) return "Confirmação de senha obrigatória";

                if (text != passKey.currentState.value) {
                  return 'Senhas não coincidem!';
                }

                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

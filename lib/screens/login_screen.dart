import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lojavirtual_mobile/models/user.model.dart';
import 'package:lojavirtual_mobile/screens/register_screen.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<UserStore>(context);

    final _emailController = new TextEditingController();
    final _passwordController = new TextEditingController();

    String _emailError;
    String _passwordError;

    void resetErrors() {
      _emailError = null;
      _passwordError = null;
    }

    void handleLogin() {
      resetErrors();

      if (_formKey.currentState.validate()) {
        UserModel user = new UserModel(
          email: _emailController.text,
          password: _passwordController.text,
        );

        store.login(user).then((data) {
          if (data["success"] == true) {
            Navigator.of(context).pop();
          } else {
            (data["data"] as List).map((dt) {
              if (dt["property"] == "E-mail") {
                _emailError = dt["message"];
              }
              if (dt["property"] == "Password") {
                _passwordError = dt["message"];
              }
            }).toList();

            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(data["message"]),
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 3),
              ),
            );
          }
        });
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            textColor: Colors.white,
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return store.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              )
            : Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      focusNode: _emailFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) => _passwordFocus.requestFocus(),
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        alignLabelWithHint: true,
                        errorText: _emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text.isEmpty || !text.contains("@"))
                          return "E-mail inválido";

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (text) => handleLogin(),
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        alignLabelWithHint: true,
                        errorText: _passwordError,
                      ),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida";

                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        onPressed: handleLogin,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text(
                          "Entrar",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}

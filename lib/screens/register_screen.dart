import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lojavirtual_mobile/models/user.model.dart';
import 'package:lojavirtual_mobile/store/user.store.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _passKey = GlobalKey<FormFieldState>();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordConfirmFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<UserStore>(context);

    final _nameController = new TextEditingController();
    final _emailController = new TextEditingController();
    final _passwordController = new TextEditingController();

    String _nameError;
    String _emailError;
    String _passwordError;

    void resetErrors() {
      _nameError = null;
      _emailError = null;
      _passwordError = null;
    }

    void handleRegister() {
      resetErrors();

      if (_formKey.currentState.validate()) {
        UserModel user = new UserModel(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );

        store.register(user).then((data) {
          print(data);
          if (data["success"] == true) {
            Navigator.of(context).pop();
          } else {
            (data["data"] as List).map((dt) {
              if (dt["property"] == "Name") {
                _nameError = dt["message"];
              }
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
        title: Text("Criar conta"),
        centerTitle: true,
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
                      focusNode: _nameFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) => _emailFocus.requestFocus(),
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Nome completo",
                        alignLabelWithHint: true,
                        errorText: _nameError,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text.isEmpty) return "Nome completo é obrigatório";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
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
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          _passwordConfirmFocus.requestFocus(),
                      controller: _passwordController,
                      key: _passKey,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        alignLabelWithHint: true,
                        errorText: _passwordError,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: _passwordConfirmFocus,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (text) => handleRegister(),
                      decoration: InputDecoration(
                        labelText: "Confirme a senha",
                        alignLabelWithHint: true,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty)
                          return "Confirmação de senha obrigatória";

                        if (text != _passKey.currentState.value)
                          return 'Senhas não coincidem!';

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        onPressed: handleRegister,
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
              );
      }),
    );
  }
}

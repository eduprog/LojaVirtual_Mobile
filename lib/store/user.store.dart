import 'package:lojavirtual_mobile/models/user.model.dart';
import 'package:lojavirtual_mobile/services/storage.service.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';
import 'package:lojavirtual_mobile/services/utils/user.authenticated.model.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert' as convert;

// Include generated file
part 'user.store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore with Store {
  @observable
  bool isLoading = false;

  @observable
  UserModel userLogged;

  @computed
  bool get isLogged => userLogged != null;

  @computed
  String get nameUser => isLogged ? userLogged.name : "";

  @action
  Future<Map<String, dynamic>> login(UserModel user) async {
    isLoading = true;

    try {
      var response = await Api.post("api/auth/login", body: user.toJson());

      if (response["success"] == true) {
        saveAuthUser(response["data"]);
      }

      isLoading = false;

      return response;
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  saveAuthUser(dynamic data) async {
    StorageService storage = StorageService();
    await storage.saveAuthUser(convert.jsonEncode(data));

    userLogged = UserModel.fromJson(data["user"]);
  }

  @action
  Future<Map<String, dynamic>> register(UserModel user) async {
    isLoading = true;

    try {
      var response = await Api.post("api/auth/register", body: user.toJson());

      if (response["success"] == true) {
        saveAuthUser(response["data"]);
      }

      isLoading = false;

      return response;
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @action
  Future logout() async {
    StorageService storage = StorageService();
    await storage.deleteAuthUser();

    userLogged = null;
  }

  @action
  Future readUser() async {
    StorageService storage = StorageService();

    var data = await storage.readAuthUser();

    if (data != null) {
      var auth = UserAuthenticated.fromJson(convert.jsonDecode(data));
      if (auth != null && auth.authenticated == true) {
        var d1 = DateTime.now().toUtc();
        var d2 = DateTime.parse(auth.expiration)
            .toUtc(); //you can add today's date here

        // Token venceu
        if (d2.compareTo(d1) <= 0) {
          return null;
        }

        userLogged = auth.user;
      }

      return await storage.readAuthUser();
    }
    return null;
  }
}

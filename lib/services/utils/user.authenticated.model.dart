import 'package:lojavirtual_mobile/models/user.model.dart';

class UserAuthenticated {
  bool authenticated;
  String created;
  String expiration;
  String accessToken;
  String message;
  UserModel user;

  UserAuthenticated(
      {this.authenticated,
      this.created,
      this.expiration,
      this.accessToken,
      this.message,
      this.user});

  UserAuthenticated.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    created = json['created'];
    expiration = json['expiration'];
    accessToken = json['accessToken'];
    message = json['message'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['created'] = this.created;
    data['expiration'] = this.expiration;
    data['accessToken'] = this.accessToken;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

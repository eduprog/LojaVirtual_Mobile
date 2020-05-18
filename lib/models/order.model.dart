import 'package:lojavirtual_mobile/models/user.model.dart';

class OrderModel {
  String id;
  String createDate;
  UserModel user;
  int totalProducts;
  int totalDiscount;
  int totalOrder;
  int status;

  OrderModel(
      {this.id,
      this.createDate,
      this.user,
      this.totalProducts,
      this.totalDiscount,
      this.totalOrder,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['createDate'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    totalProducts = json['totalProducts'];
    totalDiscount = json['totalDiscount'];
    totalOrder = json['totalOrder'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createDate'] = this.createDate;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['totalProducts'] = this.totalProducts;
    data['totalDiscount'] = this.totalDiscount;
    data['totalOrder'] = this.totalOrder;
    data['status'] = this.status;
    return data;
  }
}

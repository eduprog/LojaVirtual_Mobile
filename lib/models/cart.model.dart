import 'package:lojavirtual_mobile/models/product.model.dart';

class CartProductModel {
  String id;
  int quantity;
  String size;
  String productId;
  ProductModel product;
  int origin;

  CartProductModel(
      {this.id,
      this.quantity,
      this.size,
      this.productId,
      this.product,
      this.origin});

  CartProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    size = json['size'];
    productId = json['productId'];
    product =
        json['product'] == null ? null : ProductModel.fromJson(json['product']);
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['productId'] = this.productId;
    data['product'] = this.product;
    data['origin'] = this.origin;
    return data;
  }
}

import 'package:lojavirtual_mobile/models/product_image.model.dart';
import 'package:lojavirtual_mobile/models/product_size.model.dart';

import 'category.model.dart';

class ProductModel {
  String title;
  String description;
  double price;
  CategoryModel category;
  Null userCreate;
  List<ProductImageModel> images;
  List<ProductSizeModel> sizes;
  String id;
  String createDate;

  ProductModel(
      {this.title,
      this.description,
      this.price,
      this.category,
      this.userCreate,
      this.images,
      this.sizes,
      this.id,
      this.createDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    userCreate = json['userCreate'];
    if (json['images'] != null) {
      images = new List<ProductImageModel>();
      json['images'].forEach((v) {
        images.add(new ProductImageModel.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = new List<ProductSizeModel>();
      json['sizes'].forEach((v) {
        sizes.add(new ProductSizeModel.fromJson(v));
      });
    }
    id = json['id'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['userCreate'] = this.userCreate;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['createDate'] = this.createDate;
    return data;
  }
}

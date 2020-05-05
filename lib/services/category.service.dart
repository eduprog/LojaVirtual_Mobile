import 'package:lojavirtual_mobile/models/category.model.dart';
import 'package:lojavirtual_mobile/models/product.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class CategoryService {
  static Future<List<CategoryModel>> getCategories() async {
    var response = await Api.get("api/category");

    if (response["success"] == true) {
      return (response["data"] as List)
          .map((banners) => CategoryModel.fromJson(banners))
          .toList();
    }

    return Future.value(null);
  }

  static Future<List<ProductModel>> getProducts(String idCategory) async {
    var response = await Api.get("api/category/" + idCategory + "/products");

    if (response["success"] == true) {
      return (response["data"] as List)
          .map((banners) => ProductModel.fromJson(banners))
          .toList();
    }

    return Future.value(null);
  }
}

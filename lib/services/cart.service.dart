import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class CartService {
  static Future<CartProductModel> addItem(CartProductModel item) async {
    var response =
        await Api.post("api/cart", body: item.toJson(), withToken: true);

    if (response["success"] == true) {
      return CartProductModel.fromJson(response["data"]);
    }
    return null;
  }

  static Future<List<CartProductModel>> getItems() async {
    var response = await Api.get("api/cart", withToken: true);

    if (response["success"] == true) {
      return (response["data"] as List)
          .map((banners) => CartProductModel.fromJson(banners))
          .toList();
    }

    return Future.value(null);
  }

  static Future<bool> changeQuantity(
      CartProductModel model, bool addItem) async {
    var response = await Api.put(
        "api/cart/${model.id}/change-quantity/${addItem ? 'add' : 'rem'}",
        withToken: true);

    if (response["success"] == true) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  static Future<bool> removeItem(CartProductModel model) async {
    var response = await Api.delete("api/cart/${model.id}", withToken: true);

    if (response["success"] == true) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}

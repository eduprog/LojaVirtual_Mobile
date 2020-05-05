import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class CartService {
  static Future<CartProductModel> addItem(CartProductModel item) async {
    var response =
        await Api.post("api/cart", body: item.toJson(), withToken: true);

    print(response);
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
}

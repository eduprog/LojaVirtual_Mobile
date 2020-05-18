import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class OrderService {
  static Future<Map<String, dynamic>> saveOrder(
      String reference, List<CartProductModel> items) async {
    for (var p in items) {
      p.productId = p.product.id;
    }

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReferenceDiscount'] = reference;
    data['items'] = items;

    var response =
        await Api.post("api/order/finish", body: data, withToken: true);

    if (response["success"] == true) {
      return response;
    }
    return null;
  }
}

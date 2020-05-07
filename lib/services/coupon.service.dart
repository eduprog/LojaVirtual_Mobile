import 'package:lojavirtual_mobile/models/coupon.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class CouponService {
  static Future<CouponModel> getCouponDiscount(String reference) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = reference;

    var response =
        await Api.post("api/coupon/verify-coupon", body: data, withToken: true);

    if (response["success"] == true) {
      return CouponModel.fromJson(response["data"]);
    }
    return null;
  }
}

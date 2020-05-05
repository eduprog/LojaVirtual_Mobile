import 'package:lojavirtual_mobile/models/banner.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class BannerService {
  static Future<List<BannerModel>> getBannerByLocal(int local) async {
    var response = await Api.get("api/banner/" + local.toString());

    if (response["success"] == true) {
      return (response["data"] as List)
          .map((banners) => BannerModel.fromJson(banners))
          .toList();
    }

    return Future.value(null);
  }
}

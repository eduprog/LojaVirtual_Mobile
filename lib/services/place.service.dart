import 'package:lojavirtual_mobile/models/place.model.dart';
import 'package:lojavirtual_mobile/services/utils/Api.dart';

class PlaceService {
  static Future<List<PlaceModel>> getPlaces() async {
    var response = await Api.get("api/place");

    if (response["success"] == true) {
      return (response["data"] as List)
          .map((place) => PlaceModel.fromJson(place))
          .toList();
    }

    return Future.value(null);
  }
}

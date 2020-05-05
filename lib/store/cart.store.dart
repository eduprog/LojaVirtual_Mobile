import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/models/user.model.dart';
import 'package:lojavirtual_mobile/services/cart.service.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'cart.store.g.dart';

// This is the class used by rest of your codebase
class CartStore = _CartStore with _$CartStore;

// The store-class
abstract class _CartStore with Store {
  @observable
  bool isLoading = false;

  UserModel user;

  @observable
  List<CartProductModel> products;

  @computed
  int get cartCount => products.length;

  _CartStore() {
    this.products = new List<CartProductModel>();
  }

  @action
  Future<bool> addCartItem(CartProductModel cartProduct) async {
    isLoading = true;

    try {
      var response = await CartService.addItem(cartProduct);
      print(cartProduct);
      if (response != null) {
        cartProduct.id = response.id;
        isLoading = false;
        return Future.value(true);
      }
      isLoading = false;
      return Future.value(false);
    } catch (e) {
      isLoading = false;
      print(e);
      return Future.value(false);
    }
  }

  @action
  getItems() async {
    isLoading = true;

    try {
      var response = await CartService.getItems();

      products = response;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @action
  Future removeCartItem(CartProductModel cartProduct) async {
    products.remove(cartProduct);
    return Future;
  }
}

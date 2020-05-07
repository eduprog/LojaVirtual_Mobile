import 'package:lojavirtual_mobile/models/cart.model.dart';
import 'package:lojavirtual_mobile/models/coupon.model.dart';
import 'package:lojavirtual_mobile/models/user.model.dart';
import 'package:lojavirtual_mobile/services/cart.service.dart';
import 'package:lojavirtual_mobile/services/coupon.service.dart';
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

  @observable
  String referenceCoupon;

  @observable
  double percentDiscount;

  _CartStore() {
    this.products = new List<CartProductModel>();
  }

  @action
  Future<bool> addCartItem(CartProductModel cartProduct) async {
    isLoading = true;

    try {
      var response = await CartService.addItem(cartProduct);

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
  Future<bool> changeQuantityItem(
      CartProductModel cartProduct, bool addItem) async {
    isLoading = true;

    try {
      var response = await CartService.changeQuantity(cartProduct, addItem);

      if (response == true) {
        var response = await CartService.getItems();
        products = response;

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
  Future<CouponModel> setCouponCode(String reference) async {
    isLoading = true;

    try {
      CouponModel response = await CouponService.getCouponDiscount(reference);

      if (response != null) {
        isLoading = false;

        referenceCoupon = response.reference;
        percentDiscount = response.percent;

        return Future.value(response);
      }

      isLoading = false;
      return Future.value(null);
    } catch (e) {
      isLoading = false;
      print(e);
      return Future.value(null);
    }
  }

  @action
  Future<bool> removeCartItem(CartProductModel cartProduct) async {
    isLoading = true;

    try {
      var response = await CartService.removeItem(cartProduct);

      if (response == true) {
        var response = await CartService.getItems();
        products = response;

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
}

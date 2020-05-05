// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<int> _$cartCountComputed;

  @override
  int get cartCount =>
      (_$cartCountComputed ??= Computed<int>(() => super.cartCount)).value;

  final _$isLoadingAtom = Atom(name: '_CartStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$productsAtom = Atom(name: '_CartStore.products');

  @override
  List<CartProductModel> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(List<CartProductModel> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$addCartItemAsyncAction = AsyncAction('addCartItem');

  @override
  Future<bool> addCartItem(CartProductModel cartProduct) {
    return _$addCartItemAsyncAction.run(() => super.addCartItem(cartProduct));
  }

  final _$removeCartItemAsyncAction = AsyncAction('removeCartItem');

  @override
  Future<dynamic> removeCartItem(CartProductModel cartProduct) {
    return _$removeCartItemAsyncAction
        .run(() => super.removeCartItem(cartProduct));
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},products: ${products.toString()},cartCount: ${cartCount.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<bool> _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged)).value;
  Computed<String> _$nameUserComputed;

  @override
  String get nameUser =>
      (_$nameUserComputed ??= Computed<String>(() => super.nameUser)).value;

  final _$isLoadingAtom = Atom(name: '_UserStore.isLoading');

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

  final _$userLoggedAtom = Atom(name: '_UserStore.userLogged');

  @override
  UserModel get userLogged {
    _$userLoggedAtom.context.enforceReadPolicy(_$userLoggedAtom);
    _$userLoggedAtom.reportObserved();
    return super.userLogged;
  }

  @override
  set userLogged(UserModel value) {
    _$userLoggedAtom.context.conditionallyRunInAction(() {
      super.userLogged = value;
      _$userLoggedAtom.reportChanged();
    }, _$userLoggedAtom, name: '${_$userLoggedAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<Map<String, dynamic>> login(UserModel user) {
    return _$loginAsyncAction.run(() => super.login(user));
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<Map<String, dynamic>> register(UserModel user) {
    return _$registerAsyncAction.run(() => super.register(user));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$readUserAsyncAction = AsyncAction('readUser');

  @override
  Future<dynamic> readUser() {
    return _$readUserAsyncAction.run(() => super.readUser());
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},userLogged: ${userLogged.toString()},isLogged: ${isLogged.toString()},nameUser: ${nameUser.toString()}';
    return '{$string}';
  }
}

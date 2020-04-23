import 'package:mobx/mobx.dart';

// Include generated file
part 'user.store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore with Store {
  @observable
  bool isLoading = false;

  @action
  Future login() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    print(isLoading);
  }
}
 
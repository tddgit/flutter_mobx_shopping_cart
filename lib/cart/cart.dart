import 'package:mobx/mobx.dart';
import 'package:state_management_example/shared/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  @observable
  ObservableList<Product> _cartContent = ObservableList<Product>();
  ObservableList<Product> get cartContent => _cartContent;

  @computed
  List<Product> get uniqueProducts =>
      ObservableList<Product>.of(_cartContent).toSet().toList();

  @action
  void addToCart(Product product) {
    _cartContent.add(product);
  }

  void dispose();
}

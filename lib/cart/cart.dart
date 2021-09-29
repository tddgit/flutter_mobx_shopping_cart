import 'package:mobx/mobx.dart';
import '/shared/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  _Cart() {
    reaction((_) => _cartContent.length, (int cartItemCount) {
      if (cartItemCount >= 10 && _freight == 0) {
        _freight = 20;
      } else if (cartItemCount < 10 && _freight != 0) {
        _freight = 0;
      }
    });
  }
  @observable
  // ignore: prefer_final_fields
  ObservableList<Product> _cartContent = ObservableList<Product>();
  ObservableList<Product> get cartContent => _cartContent;

  @observable
  double _freight = 0;

  int getProductQuantity(Product product) =>
      ObservableList.of(_cartContent.where((p) => p == product)).length;

  @computed
  List<Product> get uniqueProducts =>
      ObservableList<Product>.of(_cartContent).toSet().toList();

  @computed
  double get cartValue => ObservableList<Product>.of(_cartContent)
      .map((p) => p.price)
      .fold(0, (prev, element) => prev + element);

  @computed
  double get freight =>
      ObservableList<Product>.of(_cartContent).length > 10 ? 100.0 : 0.0;

  @action
  void addToCart(Product product) {
    _cartContent.add(product);
  }

  void dispose() {
    _cartContent.clear();
  }
}

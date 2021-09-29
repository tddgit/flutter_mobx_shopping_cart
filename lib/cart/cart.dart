import 'package:mobx/mobx.dart';
import '/shared/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  _Cart() {
    _addCartFreightReaction =
        reaction((_) => _cartContent.length, (int cartItemCount) {
      if (cartItemCount >= 10 && _freight == 0) {
        _freight = 20;
      } else if (cartItemCount < 10 && _freight != 0) {
        _freight = 0;
      }
    });
  }

  late void Function() _addCartFreightReaction;

  @observable
  // ignore: prefer_final_fields
  ObservableList<Product> _cartContent = ObservableList<Product>();

  @observable
  double _freight = 0;

  @action
  void emptyCart() {
    _cartContent.clear();
  }

  ObservableList<Product> get cartContent => _cartContent;

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
  double get freight => _freight;

  @action
  void addToCart(Product product) {
    _cartContent.add(product);
  }

  @action
  void removeProductFromCart(Product product) {
    _cartContent.removeWhere((element) => element == product);
  }

  @action
  void changeProductQuantity(Product product, int quantity) {
    final int difference = quantity - getProductQuantity(product);
    _cartContent.addAll(
      List.generate(difference, (_) => product),
    );
  }

  void dispose() {
    _addCartFreightReaction();
  }
}

import '/shared/models/product.dart';
import '/shared/utils/app_variables.dart';

class ProductRange {
  ProductRange({required this.products});

  final List<Product> products;

  List<Product> getFromCategory(Category category) {
    final List<Product> specificProducts =
        products.where((product) => product.category == category).toList();

    return specificProducts;
  }
}

import 'package:flutter/material.dart';

import '/products/widgets.dart/product_card.dart';
import '/shared/models/product.dart';
import '/shared/models/product_range.dart';
import '/shared/styles/app_colors.dart';
import '/shared/utils/app_variables.dart';
import '/shared/widgets/cart_app_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductRange productRange = ProductRange(products: [
    Product(
      name: 'Blueberries',
      description: 'Delicious blueberries from the wild.',
      category: Category.food,
      price: 30.0,
      imageURL: 'assets/pictures/Blueberries.jpg',
    ),
    Product(
      name: 'Mario Game',
      description: 'Play as the famous plummer in the real world.',
      category: Category.games,
      price: 70.0,
      imageURL: 'assets/pictures/Mario.jpg',
    ),
    Product(
      name: 'Dart',
      description: 'Simple dart game.',
      category: Category.games,
      price: 20.0,
      imageURL: 'assets/pictures/Dart.jpg',
    ),
    Product(
      name: 'Watermelon',
      description: 'Water and sugar in a red solid form.',
      category: Category.food,
      price: 40.0,
      imageURL: 'assets/pictures/Watermelon.jpg',
    ),
    Product(
      name: 'Candy Crush',
      description: "Don't you have a phone?",
      category: Category.games,
      price: 5.0,
      imageURL: 'assets/pictures/Candy_Crush.jpg',
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    final double statusbar = MediaQuery.of(context).padding.top;
    final productRangeCategory = productRange.getFromCategory(widget.category);

    return Scaffold(
      body: Container(
        color: AppColors.appGray1,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: statusbar + 56),
              child: GridView.count(
                childAspectRatio: 1 / 1.26,
                padding: EdgeInsets.only(top: 10),
                crossAxisCount: 2,
                children: List.generate(productRangeCategory.length, (index) {
                  final product = productRangeCategory[index];

                  return ProductCard(product: product);
                }),
              ),
            ),
            CartAppBar(
              isHomePage: false,
              title: AppVariables.getCategoryString(widget.category),
            ),
          ],
        ),
      ),
    );
  }
}

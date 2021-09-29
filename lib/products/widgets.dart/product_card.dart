import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/cart/cart.dart';

import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  void _addToCartOnClick(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 17,
            child: Container(
              // height: 132,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(product.imageURL),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  topLeft: Radius.circular(3),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      // height: 132,
                      width: double.infinity,
                      child: Text(
                        product.name,
                        style: AppFonts.productCardTitle(),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // SizedBox(height: 5),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        product.description,
                        style: AppFonts.productCardTDescription(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      r'$' + product.price.toString(),
                      style: AppFonts.productCardPrice(),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  Expanded(
                    flex: 5,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () => _addToCartOnClick(context),
                      color: AppColors.appBlue1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: <Widget>[
                          // Icon(
                          //   Icons.add_shopping_cart,
                          //   size: 12,
                          //   color: AppColors.appWhite,
                          // ),
                          Expanded(
                            child: Text(
                              'Add to cart',
                              style: AppFonts.productCardBtn(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

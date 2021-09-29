import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '/cart/cart.dart';
import '/shared/styles/app_colors.dart';
import '/shared/styles/app_fonts.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key? key,
    required this.cartOnClick,
  }) : super(key: key);
  final void Function() cartOnClick;

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return IconButton(
      icon: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          children: <Widget>[
            Center(
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.appWhite,
              ),
            ),
            Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.fromLTRB(18, 6, 0, 0),
              padding: EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: AppColors.appRed,
                shape: BoxShape.circle,
              ),
              //Replace placeholder Text widget below
              child: Observer(
                builder: (_) {
                  return Center(
                    child: Text(
                      cart.cartContent.length.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppFonts.cartQuantityNumber(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onPressed: cartOnClick,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 15.0),
    );
  }
}

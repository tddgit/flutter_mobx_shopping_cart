import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/cart/cart.dart';
import '/shared/models/product.dart';
import '/shared/styles/app_colors.dart';
import '/shared/styles/app_fonts.dart';
import '/shared/utils/app_dialogs.dart';

class CartListTile extends StatefulWidget {
  const CartListTile({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  _CartListTileState createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  late int quantity;
  late Cart cart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cart = Provider.of<Cart>(context, listen: false);
  }

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  Future<void> tileOnClick() async {
    quantity = await AppDialog.quantityDialog(
      context: context,
      title: 'Quantity',
      quantity: widget.quantity,
    );
    cart.changeProductQuantity(widget.product, quantity);
  }

  void tileOnSwipe(Product product) {
    cart.removeProductFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tileOnSwipe(widget.product);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        color: AppColors.appWhite,
        child: ListTile(
          title: Text(
            widget.product.name,
            style: AppFonts.cartTileTitle(),
          ),
          subtitle: Text(
            'Quantity: ${widget.quantity}',
            style: AppFonts.cartTileSubTitle(),
          ),
          trailing: Text(
            '\$${widget.product.price * widget.quantity}',
            style: AppFonts.cartTileValue(),
          ),
          onTap: () async => tileOnClick(),
        ),
      ),
    );
  }
}

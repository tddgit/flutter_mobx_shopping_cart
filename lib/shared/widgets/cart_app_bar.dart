import 'package:flutter/material.dart';

import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';
import 'package:state_management_example/shared/utils/app_variables.dart';

import 'cart_icon_button.dart';
import 'cart_list_tile.dart';

class CartAppBar extends StatefulWidget {
  const CartAppBar({
    Key? key,
    required this.isHomePage,
    required this.title,
  }) : super(key: key);

  final bool isHomePage;
  final String title;

  @override
  _CartAppBarState createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
  bool showCart = false;
  //TODO: 9. Remove product and quantity placeholders
  Product product = Product(
    name: 'Blueberries',
    description: 'Delicious blueberries from the wild.',
    category: Category.food,
    price: 55.0,
    imageURL: 'assets/pictures/Blueberries.png',
  );
  int quantity = 2;

  void _cartOnClick() {
    setState(() {
      showCart = !showCart;
    });
  }

  void _deleteOnClick() {
    //TODO: 10. Make an empty cart function
  }

  void _categoryOnClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _checkoutOnClick() {
    //TODO: 15. This is up to you 😄
  }

  Widget _buildButton() {
    final Widget homeBtn = IconButton(
      icon: Icon(Icons.arrow_back, color: AppColors.appWhite),
      onPressed: () => _categoryOnClick(context),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15.0),
    );
    final Widget deleteBtn = IconButton(
      icon: Icon(Icons.delete_outline, color: AppColors.appWhite),
      onPressed: _deleteOnClick,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15.0),
    );

    return widget.isHomePage
        ? AnimatedCrossFade(
            firstChild: deleteBtn,
            secondChild: const SizedBox(width: 48),
            crossFadeState:
                showCart ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 250),
          )
        : AnimatedCrossFade(
            firstChild: deleteBtn,
            secondChild: homeBtn,
            crossFadeState:
                showCart ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 250),
          );
  }

  @override
  Widget build(BuildContext context) {
    final double statusbar = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;
    const double appBarHeight = 56;
    double dragStart = 0;
    //TODO: 6. Add provider for cart

    return GestureDetector(
      onVerticalDragStart: (d) {
        dragStart = d.globalPosition.dy;
      },
      onVerticalDragUpdate: (d) {
        if (d.globalPosition.dy > dragStart + 100) {
          setState(() => showCart = true);
        } else if (d.globalPosition.dy < dragStart - 100) {
          setState(() => showCart = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        height: showCart ? screenHeight * 0.85 : statusbar + 56,
        decoration: BoxDecoration(
          color: AppColors.appBlue1,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            _buildTopBarOfCart(appBarHeight, statusbar),
            if (showCart)
              Expanded(
                child: Column(
                  children: <Widget>[
                    _buildListOfCartContent(),
                    _buildTotalPriceTextAndGoToCheckoutButton(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBarOfCart(double appBarHeight, double statusbar) {
    return SizedBox(
      height: appBarHeight + statusbar,
      child: Padding(
        padding: EdgeInsets.only(top: statusbar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton(),
            Expanded(
              child: Text(
                showCart ? 'Cart' : widget.title,
                textAlign: TextAlign.center,
                style: AppFonts.appBarTitle(),
              ),
            ),
            CartIconButton(
              cartOnClick: _cartOnClick,
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTotalPriceTextAndGoToCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //TODO: 8. Show cart value and freight cost if any.
              //Change placeholder Text widget below
              Text(
                '\$${product.price * quantity}',
                style: AppFonts.cartValue(),
              ),
              // ignore: deprecated_member_use
              _buildCheckedOutButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListOfCartContent() {
    return Expanded(
      child: ListView(
        //TODO: 7. Show cart content
        //Change placeholder children below
        children: <Widget>[
          CartListTile(
            product: product,
            quantity: quantity,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckedOutButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.appWhite,
      splashColor: Colors.grey,
      onPressed: _checkoutOnClick,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.payment,
            color: AppColors.appBlue2,
          ),
          SizedBox(width: 5),
          Text(
            'Go to checkout',
            style: AppFonts.cartCheckOutBtn(),
          ),
        ],
      ),
    );
  }
}

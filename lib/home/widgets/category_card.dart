import 'package:flutter/material.dart';

import '/products/products.dart';
import '/shared/styles/app_colors.dart';
import '/shared/styles/app_fonts.dart';
import '/shared/utils/app_variables.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.text,
    required this.color,
    required this.iconData,
    required this.category,
  }) : super(key: key);

  final String title;
  final String text;
  final Color color;
  final IconData iconData;
  final Category category;

  void navigateToProducts({BuildContext? context, Category? category}) {
    if (context == null || category == null) return;
    Navigator.of(context).push<ProductPage>(
      MaterialPageRoute(
        builder: (context) => ProductPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: AppFonts.categoryCardTitle(),
                          ),
                          const SizedBox(height: 5),
                          Text(text, style: AppFonts.categoryCardText()),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: 165,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: color,
                          onPressed: () => navigateToProducts(
                            context: context,
                            category: category,
                          ),
                          child: Expanded(
                            child: Row(
                              children: <Widget>[
                                // Icon(
                                //   Icons.apps,
                                //   // size: 8,
                                //   color: AppColors.appWhite,
                                // ),
                                Text(
                                  'Browse ',
                                  style: AppFonts.categoryCardBtn(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                ),
                child: Icon(
                  iconData,
                  size: 75,
                  color: AppColors.appWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

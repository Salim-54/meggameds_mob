import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_constants.dart';
import '../controller/pharma.controller.dart';
import '../details/details.dart';

import '../model/product.dart';
import 'components/my_app_bar.dart';
import 'components/product_cart.dart';

class PharmacyScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sThirdColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.grey[300],
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Column(
                      children: [
                        MyAppBar(
                          title: 'Hood pharmacy!',
                          onSearchTap: () {},
                        ),
                        Expanded(
                          child: Container(
                            // height: getProportionateScreenHeight(600),
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: defaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: GridView.builder(
                              itemCount: demo_products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: defaultPadding,
                                crossAxisSpacing: defaultPadding,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: demo_products[index],
                                press: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          product: demo_products[index],
                                          onProductAdd: () {
                                            controller.addProductToCart(
                                                demo_products[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}

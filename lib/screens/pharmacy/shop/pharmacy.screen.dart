import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../providers/medicine.dart';
import '../../../size_constants.dart';
import '../components/empty_container.dart';
import '../components/skeleton.dart';
import '../controller/pharma.controller.dart';
import '../details/details.dart';

import '../model/product.dart';
import 'components/meds_list.dart';
import 'components/my_app_bar.dart';
import 'components/product_cart.dart';

class PharmacyScreen extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    List<Product> _items =
        Provider.of<ProductsProvider>(context, listen: false).items;

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
                          title: 'Hood pharmacy',
                          onSearchTap: () {},
                        ),
                        Expanded(
                          // child: ListSkleton(),
                          child:
                              MedsList(items: _items, controller: controller),
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

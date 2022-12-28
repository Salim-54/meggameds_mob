import 'package:MMEDES/screens/pharmacy/components/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../providers/medicine.dart';
import '../../controller/pharma.controller.dart';
import '../../details/details.dart';
import '../../model/product.dart';
import 'product_cart.dart';

class MedsList extends StatefulWidget {
  const MedsList({
    Key? key,
    required List<Product> items,
    required this.controller,
  })  : _items = items,
        super(key: key);

  final List<Product> _items;
  final HomeController controller;

  @override
  State<MedsList> createState() => _MedsListState();
}

class _MedsListState extends State<MedsList> {
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchData() async {
    try {
      await Provider.of<ProductsProvider>(context, listen: false)
          .fetchAndSave();
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: _loading
          ? ListSkleton()
          : Container(
              // height: getProportionateScreenHeight(600),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: GridView.builder(
                itemCount: widget._items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                ),
                itemBuilder: (context, index) => ProductCard(
                  product: widget._items[index],
                  press: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: DetailsScreen(
                            product: widget._items[index],
                            onProductAdd: () {
                              widget.controller
                                  .addProductToCart(widget._items[index]);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

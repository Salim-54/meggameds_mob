import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_constants.dart';

import '../../components/fav_icon.dart';
import '../../components/price.dart';
import '../../model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id,
              child: Container(
                height: getProportionateScreenHeight(150),
                child: FadeInImage(
                  image: NetworkImage(product.medPicture),
                  placeholder: AssetImage('assets/images/med.png'),
                ),
              ),
            ),
            Text(
              product.medName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Generic',
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(amount: product.medPrice),
                FavBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

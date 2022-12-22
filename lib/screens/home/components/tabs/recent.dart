import 'package:flutter/material.dart';

import '../my_card.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NftCard(
      imagePath: 'assets/images/pharmacy.png',
    );
  }
}

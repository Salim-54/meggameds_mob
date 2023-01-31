import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';
import '../../../size_constants.dart';

class SkeletonTileCustomSettings extends StatelessWidget {
  SkeletonTileCustomSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(25),
        color: sWhite,
      ),
    );
  }
}

class ListSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(100),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
            child: SkeletonTileCustomSettings(),
          ),
        ),
      ),
    );
  }
}

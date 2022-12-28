import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchRow extends StatelessWidget {
  final int index;
  final String medName;
  final String pattern;
  final VoidCallback press;
  const SearchRow({
    Key? key,
    required this.index,
    required this.medName,
    required this.pattern,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 13),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(color: sTextBlackColor),
              child: Text(
                '${index} . ',
                style: TextStyle(color: sWhite),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(color: sTextBlackColor),
            child: Text(
              medName,
              style: TextStyle(color: sWhite),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(color: sTextBlackColor),
              child: Text(
                pattern,
                style: TextStyle(color: sWhite),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(color: sTextBlackColor),
            child: TextButton(
              onPressed: press,
              child: Text(
                'Comment',
                style: TextStyle(color: sWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:MMEDES/providers/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../size_constants.dart';

import '../../../constants.dart';
import '../model/payment.dart';
import 'row_history.dart';
import 'row_medical.dart';
import 'skeleton.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Payment> _items = [];

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
      await Provider.of<Transactions>(context, listen: false).fetchSave();
      setState(() {
        _items = Provider.of<Transactions>(context, listen: false).items;
        print(_items);

        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "PAYMENT HISTORY",
            style: GoogleFonts.mina(
              color: sPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(160),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding * 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              // vertical: 5,
            ),
            // child: ListSkeleton(),
            child: _loading
                ? ListSkeleton()
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) => RowHistory(
                        payment: _items[index],
                        press: () {
                          // print()
                        },
                        index: index),
                  ),
          ),
        ),
      ],
    );
  }
}

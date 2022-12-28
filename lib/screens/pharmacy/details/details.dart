import 'package:MMEDES/components/default_button.dart';
import 'package:MMEDES/providers/start_transaction.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../utils/http_exceptions.dart';
import '../../../utils/snack_bar.dart';
import '../components/fav_icon.dart';
import '../components/price.dart';
import '../model/product.dart';
import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void startTransaction() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      var result = await Provider.of<StartTransaction>(
        context,
        listen: false,
      ).transaction(widget.product.id);

      // print(result);

      navigator?.pop(context);
      snackDirect(context, "Your transaction has been started!");
      await Future.delayed(Duration(milliseconds: 1300));

      // navigator!.pop(context);
      Navigator.pop(context);
    } on DioError catch (e) {
      // Check the type of the error
      showSnackbar(context, e.response?.data['message'], type: "failed");
    } on CustomHttpException catch (e) {
      showSnackbar(context, e.message, type: "failed");
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.product.id,
                    child: Image.network(widget.product.medPicture),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.medName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Price(amount: widget.product.medPrice),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text(
                        widget.product.medComment,
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          height: 1.8,
                        ),
                      ),
                    ),
                    DefaulButton(
                        disabled: false,
                        press: startTransaction,
                        // press: () async {
                        //   final prefs = await SharedPreferences.getInstance();
                        //   final extractedToken = prefs.getString("token");
                        //   print(extractedToken);
                        //   print(widget.product.id);
                        //   Navigator.pop(context);
                        // },
                        text: 'Buy this med'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.product.medName,
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../controller/search/token.controller.dart';

class MyAppBar extends StatelessWidget {
  TokenController token_controller = Get.find();

  final String title;
  VoidCallback onSearchTap;

  MyAppBar({
    Key? key,
    required this.onSearchTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
                color: Colors.grey[300],
              ),
            ),
          ),
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),
              child: Icon(
                Icons.health_and_safety,
                size: 36,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

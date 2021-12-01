import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class ReviewCart extends StatelessWidget {
  ReviewCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

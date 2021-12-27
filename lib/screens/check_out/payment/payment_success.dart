import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class PaymentSucess extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Image.asset('assets/successfully.gif'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/home/home.dart';

class PaymentSucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 370,
          ),
          Image.asset(
            'assets/success.gif',
            width: 400,
          ),
          RaisedButton(
              color: primaryColor,
              child: Container(
                child: Text('Ok'),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              })
        ],
      ),
    );
  }
}

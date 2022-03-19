import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/home/home.dart';

class PaymentSucess extends StatelessWidget {
  String imageTestUrl = 'https://fcs3pub.s3.amazonaws.com/photo-book/images/payment/success.gif';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 370),
          ExtendedImage.network(
            imageTestUrl,
            clearMemoryCacheWhenDispose: true,
            cache: false,
          ),
          RaisedButton(
              color: primaryColor,
              child: Container(
                child: Text('Go back Home'),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              })
        ],
      ),
    );
  }
}

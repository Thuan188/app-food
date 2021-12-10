import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Add Delivery Address",
          style: TextStyle(color: textColor),

        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 50,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "ADD ADDRESS",
            style: TextStyle(color: textColor),
          ),
          color: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(),
      ),
    );
  }
}

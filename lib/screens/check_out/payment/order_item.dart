import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/cart.dart';

class OrderItem extends StatelessWidget {
  final CartModel e;

  OrderItem({this.e});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 70,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: textColor,
            ),
          ),
          Text(
            e.cartUnit,
            style: TextStyle(
              color: textColor
            ),
          ),
          Text(
            "${e.cartPrice}đ",
            style: TextStyle(
              color: textColor,fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
      subtitle: Text(
        e.cartQuantity.toString(),
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

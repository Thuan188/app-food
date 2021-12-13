import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;

  SingleDeliveryItem({
    this.title,
    this.address,
    this.number,
    this.addressType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Container(
              width: 60,
              height: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  addressType,
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        leading: CircleAvatar(
          radius: 8,
          backgroundColor: primaryColor,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address),
            SizedBox(
              height: 5,
            ),
            Text(number),
          ],
        ),
      ),
      Divider(
        height: 1,
        color: Colors.black,
      )
    ]);
  }
}

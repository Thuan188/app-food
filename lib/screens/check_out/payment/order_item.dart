import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class OrderItem extends StatelessWidget {
  bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://dtgxwmigmg3gc.cloudfront.net/imagery/assets/derivations/icon/256/256/true/eyJpZCI6ImJiNDQzYzZmYmYxMThkZTRjMGY2ZDY0NjU3ZmRkYTZiLmpwZyIsInN0b3JhZ2UiOiJwdWJsaWNfc3RvcmUifQ?signature=c2fd1beb61881cdb6f63037e045b2ea1a9eb8e22e089508a8a4a38639c39df11',
        width: 70,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Food name",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          Text(
            "500g",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          Text(
            "20000đ",
            style: TextStyle(
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}

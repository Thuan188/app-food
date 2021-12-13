import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/cart.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:food_app_order/screens/check_out/delivery_address/delivery_details.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:food_app_order/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\ ${cartProvider.getTotalPrice()}đ",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          width: 170,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              if (cartProvider.getCartDataList.isEmpty) {
                return Fluttertoast.showToast(msg: "No cart data found");
              }
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DeliveryDetails()),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor),
        ),
      ),
      body: cartProvider.getCartDataList.isEmpty
          ? Center(child: Text("No data"))
          : ListView.builder(
              itemCount: cartProvider.getCartDataList.length,
              itemBuilder: (context, index) {
                CartModel data = cartProvider.getCartDataList[index];
                return Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  SingleItem(
                    isBool: true,
                    wishList: false,
                    productImage: data.cartImage,
                    productName: data.cartName,
                    productPrice: data.cartPrice,
                    productId: data.cartId,
                    productQuantity: data.cartQuantity,
                    productUnit: data.cartUnit,
                    onDelete: () {
                      showAlertDialog(context, data);
                    },
                  ),
                  Divider(
                    height: 1,
                    color: textColor,
                  )
                ]);
              },
            ),
    );
  }

  showAlertDialog(BuildContext context, CartModel delete) {
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        cartProvider.cartDeteleData(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete on product ?"),
      actions: [
        noButton,
        yesButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

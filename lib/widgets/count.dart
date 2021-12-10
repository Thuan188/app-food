import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/product.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  int productQuantity;
  var productUnit;
  Count(
      {this.productName,
      this.productImage,
      this.productId,
      this.productUnit,
      this.productQuantity,
      this.productPrice});

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    CartProvider cartProvider = Provider.of(context);
    return Expanded(
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                        cartProvider.cartDeteleData(widget.productId);
                      } else if (count > 1) {
                        setState(() {
                          count--;
                        });
                        cartProvider.updateCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,

                          //isAdd: true,
                        );
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "$count",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      cartProvider.updateCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                        //isAdd: true,
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: primaryColor,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    cartProvider.addCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      cartUnit: widget.productUnit,
                      //isAdd: true,
                    );
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
      ),
    );
  }

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        isTrue = value
                            .get("isAdd"); // neu true thi th1,false thi th2
                      })
                    }
                }
            });
  }
}

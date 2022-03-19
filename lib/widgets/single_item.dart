import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:provider/provider.dart';
import 'count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  bool wishList = false;
  int productPrice;
  String productId;
  int productQuantity;
  VoidCallback onDelete;
  var productUnit;

  SingleItem(
      {this.isBool,
      this.productImage,
      this.productName,
      this.wishList,
      this.productUnit,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.onDelete});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  CartProvider cartProvider;
  int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Image.network(widget.productImage),
          )),
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: widget.isBool == false ? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "${widget.productPrice}đ",
                        style: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                widget.isBool == false
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('500 gram'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text('1 kg'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text('1,5 kg'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text('2 kg'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                child: Text("500g", style: TextStyle(color: Colors.grey, fontSize: 15)),
                              )),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Text('${widget.productUnit}'),
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            padding: widget.isBool == false
                ? EdgeInsets.symmetric(horizontal: 18, vertical: 32)
                : EdgeInsets.only(left: 15, right: 15),
            child: widget.isBool == false
                ? Count(
                    productId: widget.productId,
                    productImage: widget.productImage,
                    productPrice: widget.productPrice,
                    productName: widget.productName,
                    productQuantity: widget.productQuantity,
                    productUnit: widget.productUnit,
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: widget.onDelete,
                          child: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        widget.wishList == false
                            ? Container(
                                //margin: EdgeInsets.only(right: 5),
                                // padding: EdgeInsets.symmetric(horizontal: 15),
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (count == 1) {
                                            Fluttertoast.showToast(
                                              msg: "It's minimum limit",
                                            );
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                            cartProvider.updateCartData(
                                              cartImage: widget.productImage,
                                              cartName: widget.productName,
                                              cartPrice: widget.productPrice,
                                              cartId: widget.productId,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                      ),
                                      Text(
                                        "$count",
                                        style: TextStyle(color: primaryColor, fontSize: 20),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (count < 10) {
                                            setState(() {
                                              count++;
                                            });
                                            cartProvider.updateCartData(
                                              cartImage: widget.productImage,
                                              cartName: widget.productName,
                                              cartPrice: widget.productPrice,
                                              cartId: widget.productId,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
          )),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 2,
                  color: Colors.black,
                )
        ],
      ),
    );
  }
}

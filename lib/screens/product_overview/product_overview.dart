

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/wishlist.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';
import 'package:food_app_order/widgets/count.dart';
import 'package:provider/provider.dart';

enum SignInCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  ProductOverview({
    Key key,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productId,
    this.productQuantity,
    this.productUnit
  }) : super(key: key);
  final String productName;
  final String productImage;
  final int productPrice;
  final String productQuantity;
  final String productId;
  final String productUnit;

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SignInCharacter _character = SignInCharacter.fill;
  Widget bottomNavigatorbar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
    Function onTap,
  }) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    ));
  }

  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWish")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishListBool = value.get("wishList");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorbar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add to WishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                      wishListId: widget.productId,
                      wishListImage: widget.productImage,
                      wishListName: widget.productName,
                      wishListPrice: widget.productPrice,
                      wishListUnit: widget.productUnit,
                      wishListQuantity: 2);
                } else {
                  wishListProvider.deleteWishList(widget.productId);
                }
              }),
          bottomNavigatorbar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go to Cart",
              iconData: Icons.shopping_cart_outlined,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ReviewCart()));
              })
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName ?? ""),
                      subtitle: Text("\ ${widget.productPrice}đ"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(widget.productImage ?? ""),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        "Available Options",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                value: SignInCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.green[700],
                                onChanged: (value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text("\ ${widget.productPrice}đ"),
                          Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productUnit: widget.productUnit,
                          )
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 10),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.grey),
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.add,
                          //         size: 15,
                          //         color: primaryColor,
                          //       ),
                          //       Text(
                          //         "ADD",
                          //         style: TextStyle(color: primaryColor),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About this products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "A product is anything that can be offered to a market for attention, acquisition, use, or consumption in order to satisfy a need or want. It can be objects, services, people, places, organizations or an idea",
                  style: TextStyle(fontSize: 15, color: textColor),
                )
              ],
            )),
          ))
        ],
      ),
    );
  }
}

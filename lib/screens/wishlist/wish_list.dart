import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/cart.dart';
import 'package:food_app_order/models/product.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:food_app_order/providers/wishlist.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:food_app_order/widgets/product_unit.dart';
import 'package:food_app_order/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  // final ProductModel productUnit;
  //
  // WishList({this.productUnit});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListProvider wishListProvider;
  // var unitData;
  // var firstUnitValue;

  @override
  Widget build(BuildContext context) {


    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();

    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstUnitValue = element;
    //   });
    //   return true;
    // });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        backgroundColor: primaryColor,
        title: Text(
          "WishList",
          style: TextStyle(color: textColor),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishListDataList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishListDataList[index];
          return Column(children: [

            SizedBox(
              height: 10,
            ),
            SingleItem(
              isBool: true,
              productImage: data.productImage,
              productName: data.productName,
              productPrice: data.productPrice,
              productId: data.productId,
              productQuantity: data.productQuantity,
//productUnit:  unitData == null ? firstUnitValue : unitData,
              onDelete: () {
                showAlertDialog(context, data);
              },
            ),
            // Expanded(
            //   child: ProductUnit(
            //     onTap: () {
            //       showModalBottomSheet(
            //         context: context,
            //         builder: (context) {
            //           return Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: widget.productUnit.productUnit
            //                 .map<Widget>((data) {
            //               return Column(
            //                 children: [
            //                   Padding(
            //                     padding:
            //                     const EdgeInsets.symmetric(
            //                         vertical: 18.0,
            //                         horizontal: 10),
            //                     child: InkWell(
            //                       onTap: () async {
            //                         setState(() {
            //                           unitData = data;
            //                         });
            //                         Navigator.of(context).pop();
            //                       },
            //                       child: Text(
            //                         data,
            //                         style: TextStyle(
            //                             color: primaryColor),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               );
            //             }).toList(),
            //           );
            //         },
            //       );
            //     },
            //     title:
            //     unitData == null ? firstUnitValue : unitData,
            //   ),
            // ),
          ]);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context, ProductModel delete) {
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you delete on wishlist Product ?"),
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

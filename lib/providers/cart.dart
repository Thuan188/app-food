import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app_order/models/cart.dart';

class CartProvider with ChangeNotifier {
  void addCartData({
    String cartId,
    String cartImage,
    String cartName,
    int cartPrice,
    int cartQuantity,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "cartUnit": cartUnit,
      "isAdd": true
    });
  }

  void updateCartData({
    String cartId,
    String cartImage,
    String cartName,
    int cartPrice,
    int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCart")
        .doc(cartId)
        .update({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true
    });
  }

  List<CartModel> cartDataList = [];
  void getCartData() async {
    List<CartModel> newList = [];
    QuerySnapshot cartValue = await FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCart")
        .get();
    cartValue.docs.forEach((element) {
      CartModel cartModel = CartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartPrice: element.get("cartPrice"),
        cartName: element.get("cartName"),
        cartQuantity: element.get("cartQuantity"),
        cartUnit: element.get("cartUnit"),
      );
      newList.add(cartModel);
    });
    cartDataList = newList;
    notifyListeners();
  }

  List<CartModel> get getCartDataList {
    return cartDataList;
  }

  //total price
  getTotalPrice() {
    double total = 0;
    cartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;

    });
    return total.toInt();
  }

  // delete cart

  cartDeteleData(cartId) {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}

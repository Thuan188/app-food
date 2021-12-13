import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app_order/models/product.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    String wishListId,
    String wishListImage,
    String wishListName,
    int wishListPrice,
    int wishListQuantity,
    var wishListUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWish")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishListUnit":wishListUnit,
      "wishList": true
      
    });
  }

  List<ProductModel> wishList = [];

  //get data
  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWish")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productPrice: element.get("wishListPrice"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productUnit: element.get("wishListUnit"),
          productQuantity: element.get(("wishListQuantity"),

          ));
      newList.add(productModel);
    });
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishListDataList {
    return wishList;
  }

  //delete wishlist
  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWish")
        .doc(wishListId)
        .delete();
  }
}

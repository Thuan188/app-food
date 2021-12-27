import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> vegetableProductList = [];
  List<ProductModel> freshProductList = [];
  List<ProductModel> dairyProductList = [];
  ProductModel productModel;

  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productUnit: element.get("productUnit"),
    );
    search.add(productModel);
  }

//vegetable product
  fetchVegetableProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Vegetable").get();

    value.docs.forEach((element) {
      // print(element.data());
      productModels(element);
      newList.add(productModel);
    });
    vegetableProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getVegetableDatalist {
    return vegetableProductList;
  }

//fresh product
  fetchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Fresh").get();

    value.docs.forEach((element) {
      // print(element.data());
      productModels(element);
      newList.add(productModel);
    });
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshDatalist {
    return freshProductList;
  }

  //dairy product
  fetchDairyProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Dairy").get();

    value.docs.forEach((element) {
      // print(element.data());
      productModels(element);
      newList.add(productModel);
    });
    dairyProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getDairyDatalist {
    return dairyProductList;
  }

  //search
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}

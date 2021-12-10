import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/providers/product.dart';
import 'package:food_app_order/providers/user.dart';
import 'package:food_app_order/screens/home/drawer_side.dart';
import 'package:food_app_order/screens/home/signal_product.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/product_overview/product_overview.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';
import 'package:food_app_order/screens/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchVegetableProductData();
    productProvider.fetchFreshProductData();
    productProvider.fetchDairyProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: DrawerSide(userProvider: userProvider,),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getAllProductSearch,
                          )));
                },
                icon: Icon(
                  Icons.search,
                  size: 22,
                ),
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()));
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: textColor,
                  ),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://previews.123rf.com/images/vaaseenaa/vaaseenaa1802/vaaseenaa180200358/94718650-healthy-vegan-food-concept-fruits-vegetables-background-vegetable-products-cereals-and-beans-for-a-v.jpg')),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50))),
                              child: Center(
                                child: Text(
                                  'Vegetable',
                                  style: TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.green,
                                            blurRadius: 10,
                                            offset: Offset(3, 3))
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "20% Sale Off",
                            style:
                                TextStyle(fontSize: 30, color: Colors.red[900]),
                          ),
                          Text(
                            "On all vegatables",
                            style: TextStyle(
                                fontSize: 15, color: Colors.redAccent),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            itemVegetableProduct(context),
            SizedBox(
              height: 10,
            ),
            itemFreshProduct(context),
            SizedBox(
              height: 10,
            ),
            itemDairyProducts(context)
          ],
        ),
      ),
    );
  }

  Widget itemFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getFreshDatalist,
                          )));
                },
                child: Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshDatalist
                .map(
                  (freshData) => SignalProduct(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverview(
                                productId: freshData.productId,
                                productPrice: freshData.productPrice,
                                productName: freshData.productName,
                                productImage: freshData.productImage,
                              )));
                    },
                    productId: freshData.productId,
                    productPrice: freshData.productPrice,
                    productName: freshData.productName,
                    productImage: freshData.productImage,
                    productUnit: freshData.productUnit,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget itemDairyProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dairy Products',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getDairyDatalist,
                          )));
                },
                child: Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: productProvider.getDairyDatalist
                  .map(
                    (dairyData) => SignalProduct(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverview(
                                  productId: dairyData.productId,
                                  productPrice: dairyData.productPrice,
                                  productName: dairyData.productName,
                                  productImage: dairyData.productImage,
                                )));
                      },
                      productId: dairyData.productId,
                      productPrice: dairyData.productPrice,
                      productName: dairyData.productName,
                      productImage: dairyData.productImage,
                      productUnit: dairyData.productUnit,
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }

  Widget itemVegetableProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vegetable Products',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            search: productProvider.getVegetableDatalist,
                          )));
                },
                child: Text(
                  'See all',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getVegetableDatalist
                .map(
                  (vegetableData) => SignalProduct(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverview(
                                productId: vegetableData.productId,
                                productPrice: vegetableData.productPrice,
                                productName: vegetableData.productName,
                                productImage: vegetableData.productImage,
                              )));
                    },
                    productId: vegetableData.productId,
                    productPrice: vegetableData.productPrice,
                    productName: vegetableData.productName,
                    productImage: vegetableData.productImage,
                    productUnit: vegetableData.productUnit,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

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
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fetchVegetableProductData();
    initproductProvider.fetchFreshProductData();
    initproductProvider.fetchDairyProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider.getAllProductSearch),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xffd6d382),
                radius: 16,
                child: Icon(
                  Icons.shopping_cart,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
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
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vangle',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '15% Off',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
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
            itemDairyProducts(context),
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
                    productId: freshData.productId,
                    productPrice: freshData.productPrice,
                    productName: freshData.productName,
                    productImage: freshData.productImage,
                    productUnit: freshData.productUnit,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverview(
                                productId: freshData.productId,
                                productPrice: freshData.productPrice,
                                productName: freshData.productName,
                                productImage: freshData.productImage,
                              )));
                    },
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
                      productId: dairyData.productId,
                      productPrice: dairyData.productPrice,
                      productName: dairyData.productName,
                      productImage: dairyData.productImage,
                      productUnit: dairyData.productUnit,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverview(
                                  productId: dairyData.productId,
                                  productPrice: dairyData.productPrice,
                                  productName: dairyData.productName,
                                  productImage: dairyData.productImage,
                                )));
                      },
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
                    productId: vegetableData.productId,
                    productPrice: vegetableData.productPrice,
                    productName: vegetableData.productName,
                    productImage: vegetableData.productImage,
                    productUnit: vegetableData.productUnit,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverview(
                                productId: vegetableData.productId,
                                productPrice: vegetableData.productPrice,
                                productName: vegetableData.productName,
                                productImage: vegetableData.productImage,
                              )));
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/screens/home/drawer_side.dart';
import 'package:food_app_order/screens/home/signal_product.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/product_overview/product_overview.dart';
import 'package:food_app_order/screens/search/search.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search()));
                },
                icon:Icon(
                Icons.search),
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: CircleAvatar(
              radius: 15,
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: textColor,
                ),
              ),
              backgroundColor: primaryColor,
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
                              //16p30s
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
            itemMilkProducts(context)
          ],
        ),
      ),
    );
  }

  Widget itemFreshProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productName: "Bannana",
                        productImage:
                        "https://tsf.vn/Upload/product/iqf-banana-9319.png",
                      )));
                },
                productName: "Bannana",
                productImage:
                "https://tsf.vn/Upload/product/iqf-banana-9319.png",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productName: "Mangoes",
                        productImage:
                        "https://product.hstatic.net/1000119621/product/xoai_20cat_20hoa_20loc-502x502_0ac68d3067aa49d8841cbd55d1be4c41_large.png",
                      )));
                },
                productName: "Mangoes",
                productImage:
                "https://product.hstatic.net/1000119621/product/xoai_20cat_20hoa_20loc-502x502_0ac68d3067aa49d8841cbd55d1be4c41_large.png",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productName: "Plum",
                        productImage:
                        "https://nongsansachmiennam.com/upload/product/22-removebg-preview-4378.png",
                      )));
                },
                productName: "Plum",
                productImage:
                "https://nongsansachmiennam.com/upload/product/22-removebg-preview-4378.png",
                productPrice: 30000,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget itemMilkProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dairy Products',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cheese",
                            productImage:
                                "https://salt.tikicdn.com/cache/525x525/ts/product/00/bd/ef/d1dd18cef3cf91ee3fd0b1d00b75a1ad.png",
                          )));
                },
                productName: "Cheese",
                productImage:
                    "https://salt.tikicdn.com/cache/525x525/ts/product/00/bd/ef/d1dd18cef3cf91ee3fd0b1d00b75a1ad.png",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Dairy cows",
                            productImage:
                                "https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2021/04/FinoPackshot_Khongduong_540x440_acf_cropped.png",
                          )));
                },
                productName: "Dairy cows",
                productImage:
                    "https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2021/04/FinoPackshot_Khongduong_540x440_acf_cropped.png",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Butter",
                            productImage:
                                "https://dtgxwmigmg3gc.cloudfront.net/imagery/assets/derivations/icon/512/512/true/eyJpZCI6IjU5ZjVhNGMwYzcxZTgwNzkwNDI1YzBiM2JjNThiNGM2Iiwic3RvcmFnZSI6InB1YmxpY19zdG9yZSJ9?signature=a700038c388995c7eb2c9ef9ddd79e6581a12018b23ae7b23cc3281a5f92760d",
                          )));
                },
                productName: "Butter",
                productImage:
                    "https://dtgxwmigmg3gc.cloudfront.net/imagery/assets/derivations/icon/512/512/true/eyJpZCI6IjU5ZjVhNGMwYzcxZTgwNzkwNDI1YzBiM2JjNThiNGM2Iiwic3RvcmFnZSI6InB1YmxpY19zdG9yZSJ9?signature=a700038c388995c7eb2c9ef9ddd79e6581a12018b23ae7b23cc3281a5f92760d",
                productPrice: 30000,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget itemVegetableProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vegetable Products',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Tomatoes",
                            productImage:
                                "https://dtgxwmigmg3gc.cloudfront.net/imagery/assets/derivations/icon/256/256/true/eyJpZCI6ImJiNDQzYzZmYmYxMThkZTRjMGY2ZDY0NjU3ZmRkYTZiLmpwZyIsInN0b3JhZ2UiOiJwdWJsaWNfc3RvcmUifQ?signature=c2fd1beb61881cdb6f63037e045b2ea1a9eb8e22e089508a8a4a38639c39df11",
                          )));
                },
                productName: "Tomatoes",
                productImage:
                    "https://dtgxwmigmg3gc.cloudfront.net/imagery/assets/derivations/icon/256/256/true/eyJpZCI6ImJiNDQzYzZmYmYxMThkZTRjMGY2ZDY0NjU3ZmRkYTZiLmpwZyIsInN0b3JhZ2UiOiJwdWJsaWNfc3RvcmUifQ?signature=c2fd1beb61881cdb6f63037e045b2ea1a9eb8e22e089508a8a4a38639c39df11",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Cabbage",
                            productImage:
                                "https://fujimart.vn/image/cache/catalog/rau%20cu%20qua/BAP%20CAI%20TIM%20DA%20LAT-502x502.png",
                          )));
                },
                productName: "Cabbage",
                productImage:
                    "https://fujimart.vn/image/cache/catalog/rau%20cu%20qua/BAP%20CAI%20TIM%20DA%20LAT-502x502.png",
                productPrice: 30000,
              ),
              SignalProduct(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                            productName: "Potatoes",
                            productImage:
                                "https://i2.wp.com/uforganics.com.vn/wp-content/uploads/2019/06/083-khoai-t%C3%A2y-h%E1%BB%AFu-c%C6%A1-organic-ufo-univers-farms-organics-s%E1%BA%A1ch-ti%C3%AAu-chu%E1%BA%A9n-ch%C3%A2u-%C3%A2u.png?fit=800%2C800&ssl=1",
                          )));
                },
                productName: "Potatoes",
                productImage:
                    "https://i2.wp.com/uforganics.com.vn/wp-content/uploads/2019/06/083-khoai-t%C3%A2y-h%E1%BB%AFu-c%C6%A1-organic-ufo-univers-farms-organics-s%E1%BA%A1ch-ti%C3%AAu-chu%E1%BA%A9n-ch%C3%A2u-%C3%A2u.png?fit=800%2C800&ssl=1",
                productPrice: 30000,
              )
            ],
          ),
        ),
      ],
    );
  }
}

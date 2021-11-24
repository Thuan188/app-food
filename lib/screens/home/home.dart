import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/screens/home/signal_product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Guest"),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 30,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text("Login"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(width: 2)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              listTile(Icons.home_outlined, "Home"),
              listTile(Icons.shopping_bag_outlined, "Cart"),
              listTile(Icons.person_outline, "My Profile"),
              listTile(Icons.notifications_outlined, "Notification"),
              listTile(Icons.star_border_outlined, "Rating & Review"),
              listTile(Icons.favorite_outline, "Wishlist"),
              listTile(Icons.copy_outlined, "Raise a Complaint "),
              listTile(Icons.file_copy_outlined, "FAQs"),
              Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Contact Support"),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Text("Call us: "),
                        ),
                        Text(
                          "+84 898 210 911",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3, left: 10),
                            child: Text("Mail us: "),
                          ),
                          Text(
                            "admin.food@gmail.com",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.greenAccent,
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.shop,
                color: Colors.black,
              ),
              backgroundColor: Colors.greenAccent,
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Vegetables',
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
                  itemProductVegetables(),
                  itemProductVegetables(),
                  itemProductVegetables(),
                  itemProductVegetables()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SignalProduct(
                    productName: "Bannana",
                    productImage: "https://tsf.vn/Upload/product/iqf-banana-9319.png",
                    productPrice: 30000,
                  ),
                  SignalProduct(
                    productName: "Bannana",
                    productImage: "https://tsf.vn/Upload/product/iqf-banana-9319.png",
                    productPrice: 30000,
                  ),
                  SignalProduct(
                    productName: "Bannana",
                    productImage: "https://tsf.vn/Upload/product/iqf-banana-9319.png",
                    productPrice: 30000,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Milk Products',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SignalProduct(
                    productName: "Cheese",
                    productImage: "https://salt.tikicdn.com/cache/525x525/ts/product/00/bd/ef/d1dd18cef3cf91ee3fd0b1d00b75a1ad.png",
                    productPrice: 45000,
                  ),
                  SignalProduct(
                    productName: "Cheese",
                    productImage: "https://salt.tikicdn.com/cache/525x525/ts/product/00/bd/ef/d1dd18cef3cf91ee3fd0b1d00b75a1ad.png",
                    productPrice: 45000,
                  ),
                  SignalProduct(
                    productName: "Cheese",
                    productImage: "https://salt.tikicdn.com/cache/525x525/ts/product/00/bd/ef/d1dd18cef3cf91ee3fd0b1d00b75a1ad.png",
                    productPrice: 45000,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemProductVegetables() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            height: 250,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(
                        'https://i.pinimg.com/originals/fb/3d/19/fb3d19eed64b4f577d7384f011788a88.png')),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tomatoes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '20000đ/kg',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text(
                                    '1kg',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.redAccent,
                                )
                              ],
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        drawer: Drawer(),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/proxy/bHFZCNVJLCybq1nho_UrTo9NB64oneCxRuwK_cKrTOLNdEe2VyqlQIcy8ofRtLAxfNmUp9nTB9Y0tGx-_Swblg0KP_0')),
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
                              style: TextStyle(
                                  fontSize: 30, color: Colors.red[100]),
                            ),
                            Text(
                              "On all vegatables",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                height: 15,
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
                    itemProduct(),itemProduct(),itemProduct(),itemProduct()
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Fruits',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  Widget itemProduct(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            height: 240,
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
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tomatoes',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
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
                                        borderRadius:
                                        BorderRadius.circular(10)),
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
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.remove,color: Colors.redAccent,),
                                        Text("1",style: TextStyle(fontSize: 18),),
                                        Icon(Icons.add,color: Colors.redAccent,)
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
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/product.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:food_app_order/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";


  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.sort),
            ),
          ),
        ],
        backgroundColor: primaryColor,
        title: Text(
          "Search",
          style: TextStyle(color: textColor),
        ),
      ),
      body:  ListView(
            children: [
              ListTile(
                title: Text("Items"),
              ),
              Container(
                height: 52,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  cursorColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xffc2c2c2),
                    filled: true,
                    hintText: "Search for items in the store",
                    suffixIcon: Icon(Icons.search,color: primaryColor,),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(

                children: _searchItem.map((data) {
                  return SingleItem(
                    isBool: false,
                    productImage: data.productImage,
                    productName: data.productName,
                    productPrice: data.productPrice,
                  );
                }).toList(),
              )
            ],
          ),
    );
  }
}
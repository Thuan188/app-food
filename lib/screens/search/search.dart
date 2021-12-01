import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/search/search_item.dart';

class Search extends StatelessWidget {
  Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",style: TextStyle(color: textColor),),
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded,color: textColor),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xf131010),
                  filled: true,
                  hintText: "Search for items:",
                  suffixIcon: Icon(Icons.search_rounded)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SearchItem(),
          SearchItem(),
          SearchItem(),
          SearchItem(),
          SearchItem(),
          SearchItem(),
          SearchItem(),
          SearchItem(),

        ],
      ),
    );
  }
}

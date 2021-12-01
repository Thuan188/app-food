import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';

class SearchItem extends StatelessWidget {
  SearchItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Center(
              child: Image.network(
                  "https://fujimart.vn/image/cache/catalog/rau%20cu%20qua/BAP%20CAI%20TIM%20DA%20LAT-502x502.png"),
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "productName",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "39999/1kg",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("0,5kg",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                      Center(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: 110,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 35),
            child: Container(
              //margin: EdgeInsets.only(right: 5),
             // padding: EdgeInsets.symmetric(horizontal: 5),
              height: 35,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: primaryColor,
                      size: 25,
                    ),
                    Text(
                      "ADD",
                      style: TextStyle(color: primaryColor, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

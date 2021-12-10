import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/product.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:food_app_order/widgets/single_item.dart';

enum SignInCharacter { lowToHigh, highToLow, alphabetically }

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({Key key, this.search}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SignInCharacter _character = SignInCharacter.alphabetically;

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
    void bottomSheet() => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: new Text(
                  'Sort by',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile(
                  value: SignInCharacter.lowToHigh,
                  groupValue: _character,
                  title: Text('Price Low to high'),
                  onChanged: (val) {
                    setState(() {
                      _character = val;
                    });
                    Navigator.of(context).pop();
                  }),
              RadioListTile(
                  value: SignInCharacter.highToLow,
                  groupValue: _character,
                  title: Text('Price High to low'),
                  onChanged: (val) {
                    setState(() {
                      _character = val;
                    });
                    Navigator.of(context).pop();
                  }),
              RadioListTile(
                  value: SignInCharacter.alphabetically,
                  groupValue: _character,
                  title: Text('Alphabetially'),
                  onChanged: (val) {
                    setState(() {
                      _character = val;
                    });
                    Navigator.of(context).pop();
                  }),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: primaryColor,
                  onPressed: () {},
                ),
              )
            ],
          );
        });
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
        title: Text(
          "Search",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  bottomSheet();
                },
                icon: Icon(Icons.sort, color: textColor)),
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
              onChanged: (value) {
                setState(() {
                  print(value);
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xf131010),
                  filled: true,
                  hintText: "Search for items:",
                  suffixIcon: Icon(
                    Icons.search,
                    color: primaryColor,
                  )),
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

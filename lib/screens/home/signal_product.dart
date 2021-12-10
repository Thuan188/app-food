import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/product.dart';
import 'package:food_app_order/widgets/count.dart';
import 'package:food_app_order/widgets/product_unit.dart';

class SignalProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;
  final productUnit;

  SignalProduct({
    Key key,
    this.productImage,
    this.productName,
    this.productPrice,
    this.onTap,
    this.productId,
    this.productUnit,
  }) : super(key: key);

  @override
  State<SignalProduct> createState() => _SignalProductState();
}

class _SignalProductState extends State<SignalProduct> {
  var unitData;
  var firstUnitValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.firstWhere((element) {
      setState(() {
        firstUnitValue = element;
      });
      return true;
    });
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            height: 240,
            width: 177,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 160,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        ' ${widget.productPrice}đ/${unitData == null ? firstUnitValue : unitData}',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ProductUnit(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: widget.productUnit
                                          .map<Widget>((data) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 18.0,
                                                      horizontal: 10),
                                              child: InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    unitData = data;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  data,
                                                  style: TextStyle(
                                                      color: primaryColor),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      }).toList(),
                                    );
                                  },
                                );
                              },
                              title:
                                  unitData == null ? firstUnitValue : unitData,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                            productName: widget.productName,
                            productUnit:  unitData == null ? firstUnitValue : unitData,
                          )
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

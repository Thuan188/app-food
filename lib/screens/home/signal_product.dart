import 'package:flutter/material.dart';

class SignalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;

  SignalProduct(
      {Key key,
      this.productImage,
      this.productName,
      this.productPrice,
      this.onTap,
      this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(
                        productImage)),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '${productPrice}/kg',
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
}

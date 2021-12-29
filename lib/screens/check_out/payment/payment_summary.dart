import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/delivery_address.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:food_app_order/providers/check_out.dart';
import 'package:food_app_order/providers/product.dart';
import 'package:food_app_order/screens/check_out/delivery_address/single_delivery.dart';
import 'package:food_app_order/screens/check_out/payment/my_google_pay.dart';
import 'package:food_app_order/screens/check_out/payment/order_item.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';
import 'package:food_app_order/widgets/custom_expansion_tile.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;

  PaymentSummary({this.deliveryAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  Work,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
  Color _textColor = textColor;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();

    double discount = 15;
    int shippingCharge = 15000;
    double total;
    double discountValue;
    int totalPrice = cartProvider.getTotalPrice();
    if (totalPrice > 200000) {
      discountValue = (totalPrice * discount) / 100;

      total = totalPrice - discountValue;
      //print(total);
    }

    // print(total);
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
          'Payment Summary',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          '\ ${total.toInt() + shippingCharge.toInt() ?? totalPrice}đ',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            onPressed: () {
              myType == AddressTypes.OnlinePayment
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyGooglePay(
                            total: total,
                          )))
                  : myType == AddressTypes.Home
                      ? Container()
                      : Container();
            },
            child: Text('Pay'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(children: [
              SingleDeliveryItem(
                address:
                    "${widget.deliveryAddressList.street}, ${widget.deliveryAddressList.village}, ${widget.deliveryAddressList.ward}, ${widget.deliveryAddressList.district}, ${widget.deliveryAddressList.city}, ${widget.deliveryAddressList.country} ,",
                title:
                    "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
                addressType: widget.deliveryAddressList.addressType ==
                        "AddressTypes.Other"
                    ? "Other"
                    : widget.deliveryAddressList.addressType ==
                            "AddressTypes.Home"
                        ? "Home"
                        : "Work",
                number: widget.deliveryAddressList.mobilePhone,
              ),
              Divider(),
              ExpansionTile(
                title: Text(
                  'Order Items ${cartProvider.getCartDataList.length}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
                children: cartProvider.getCartDataList.map((e) {
                  return OrderItem(e: e);
                }).toList(),
                iconColor: Colors.green,
                collapsedIconColor: Colors.black,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textColor = primaryColor;
                    } else {
                      _textColor = textColor;
                    }
                  });
                },
              ),
              Divider(),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Sub Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "${totalPrice.toInt()}đ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Shipping Charge",
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                trailing: Text(
                  "${shippingCharge}đ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 5,
                leading: Text(
                  "Discount",
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                trailing: Text(
                  "${discountValue.toInt()}đ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Text('Payment Options'),
              ),
              RadioListTile(
                value: AddressTypes.Home,
                groupValue: myType,
                activeColor: primaryColor,
                title: Text("Home"),
                secondary: Icon(
                  Icons.home,
                  color: primaryColor,
                ),
                onChanged: (AddressTypes value) {
                  setState(() {
                    myType = value;
                  });
                },
              ),
              RadioListTile(
                value: AddressTypes.Work,
                groupValue: myType,
                activeColor: primaryColor,
                title: Text("Work"),
                secondary: Icon(
                  Icons.work,
                  color: primaryColor,
                ),
                onChanged: (AddressTypes value) {
                  setState(() {
                    myType = value;
                  });
                },
              ),
              RadioListTile(
                value: AddressTypes.OnlinePayment,
                activeColor: primaryColor,
                groupValue: myType,
                title: Text("Online Payment"),
                secondary: Icon(
                  Icons.payment_outlined,
                  color: primaryColor,
                ),
                onChanged: (AddressTypes value) {
                  setState(() {
                    myType = value;
                  });
                },
              )
            ]);
          },
        ),
      ),
    );
  }
}

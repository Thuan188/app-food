import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/delivery_address.dart';
import 'package:food_app_order/providers/check_out.dart';
import 'package:food_app_order/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:food_app_order/screens/check_out/delivery_address/single_delivery.dart';
import 'package:food_app_order/screens/check_out/payment/payment_summary.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  bool isAddress = false;
  DeliveryAddressModel value;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Delivery Details",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddDeliveryAddress()),
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("ADD NEW ADDRESS")
              : Text('PAYMENT SUMMARY'),
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddDeliveryAddress(),
                  ))
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaymentSummary(deliveryAddressList: value),
                  ));
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Delivery to:"),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(
                  child: Center(child: Text("No data")),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList.map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      address: "${e.street}, ${e.village}, ${e.ward}, ${e.district}, ${e.city}, ${e.country} ,",
                      title: "${e.firstName} ${e.lastName}",
                      addressType: e.addressType == "AddressTypes.Other"
                          ? "Other"
                          : e.addressType == "AddressTypes.Home"
                              ? "Home"
                              : "Work",
                      number: e.mobilePhone,
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }

  List<Widget> address = [
    SingleDeliveryItem(
      address: "Phu Hoa 2, Hoa Nhon, Hoa Vang, Da Nang, Viet Nam",
      title: "Dong Duc",
      addressType: "Home",
      number: "+8498210911",
    )
  ];
}

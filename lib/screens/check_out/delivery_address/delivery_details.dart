import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:food_app_order/screens/check_out/delivery_address/single_delivery.dart';
import 'package:food_app_order/screens/check_out/payment/payment_summary.dart';

class DeliveryDetails extends StatelessWidget {
  bool isAddress = false;
  @override
  Widget build(BuildContext context) {
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
          "Delivery Details",
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddDeliveryAddress()));
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: address.isEmpty
              ? Text("ADD NEW ADDRESS")
              : Text('PAYMENT SUMMARY'),
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddDeliveryAddress()))
                : Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentSummary()));
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Delivery to:"),
            leading: Image.asset(
              'assets/location-pin.png',
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : SingleDeliveryItem(
                      address:
                          "Phu Hoa 2, Hoa Nhon, Hoa Vang, Da Nang, Viet Nam",
                      title: "Dong Duc",
                      addressType: "Home",
                      number: "+8498210911",
                    )
            ],
          )
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

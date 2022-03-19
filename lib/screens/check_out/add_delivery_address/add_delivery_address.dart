import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/check_out.dart';
import 'package:food_app_order/screens/google_map/google_map.dart';
import 'package:food_app_order/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    var addressType = AddressTypes.Home == "";
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Add Delivery Address", style: TextStyle(color: textColor)),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 50,
        child: checkoutProvider.isLoading == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "ADD ADDRESS",
                  style: TextStyle(color: textColor),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile phone",
              controller: checkoutProvider.mobilePhone,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: "Village",
              controller: checkoutProvider.village,
            ),
            CustomTextField(
              labText: "Ward",
              controller: checkoutProvider.ward,
            ),
            CustomTextField(
              labText: "District",
              controller: checkoutProvider.district,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labText: "Country",
              controller: checkoutProvider.country,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomGoogleMap()),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation == null
                        ? Text("Set Location", style: TextStyle(fontSize: 15))
                        : Text('Done !')
                  ],
                ),
              ),
            ),
            Divider(
              color: textColor,
            ),
            ListTile(
              title: Text("Address Type(*)"),
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
              activeColor: primaryColor,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes value) {
                setState(() {
                  myType = value;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              activeColor: primaryColor,
              groupValue: myType,
              title: Text("Other"),
              secondary: Icon(
                Icons.other_houses,
                color: primaryColor,
              ),
              onChanged: (AddressTypes value) {
                setState(() {
                  myType = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

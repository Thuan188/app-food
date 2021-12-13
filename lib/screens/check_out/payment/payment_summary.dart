import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/check_out/payment/order_item.dart';

class PaymentSummary extends StatefulWidget {
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
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
          'Payment Summary',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: ListTile(
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            onPressed: () {},
            child: Text('Place Order'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        title: Text('Total Amount'),
        subtitle: Text(
          '\150000đ',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                title: Text('First & Last Name'),
                subtitle:
                    Text("Phu Hoa 2, Hoa Nhon, Hoa Vang, Da Nang, Viet Nam"),
              ),
              Divider(),
              Theme(
                data: Theme.of(context).copyWith(backgroundColor: primaryColor),
                child: ExpansionTile(
                  title: Text('Order Item'),
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                ),
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
                  "130000đ",
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
                  "15000đ",
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
                  "15000đ",
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

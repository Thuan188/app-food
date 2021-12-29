import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/check_out/payment/payment_success.dart';
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

class MyGooglePay extends StatefulWidget {
  final double total;

  MyGooglePay({this.total});

  @override
  _MyGooglePayState createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  final _paymentItems = <PaymentItem>[];

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server or PSP
    //print('Thong tin thanh toan $paymentResult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:primaryColor,
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
          'Confirm Payment',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 600,
                child: Image.asset('assets/all_product.png',
                    height: MediaQuery.of(context).size.height)),
          ],
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text(
          'Total amount you pay ',
        ),
        subtitle: Text(
          '\ ${widget.total.toInt()}đ ',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            animationDuration: Duration(seconds: 3),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentSucess()));
            },
            child: GooglePayButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentSucess()));
              },
              width: 100,
              paymentConfigurationAsset: 'sample_payment_configuration.json',
              paymentItems: [
                PaymentItem(
                  label: 'Total',
                  type: PaymentItemType.total,
                  amount: '${widget.total.toString()}',
                  status: PaymentItemStatus.final_price,
                )
              ],
              style: GooglePayButtonStyle.black,
              type: GooglePayButtonType.pay,
              onPaymentResult: onGooglePayResult,
              // loadingIndicator: Center(
              //   child: CircularProgressIndicator(
              //     backgroundColor: primaryColor,
              //   ),
              // ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}

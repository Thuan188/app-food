import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app_order/models/delivery_address.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobilePhone = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController ward = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  LocationData setLocation;

  void validator(context, myType) async {
    print(setLocation);
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last name is empty");
    } else if (mobilePhone.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile phone is empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is empty");
    } else if (village.text.isEmpty) {
      Fluttertoast.showToast(msg: "Village is empty");
    } else if (ward.text.isEmpty) {
      Fluttertoast.showToast(msg: "Ward is empty");
    } else if (district.text.isEmpty) {
      Fluttertoast.showToast(msg: "District is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is empty");
    } else if (country.text.isEmpty) {
      Fluttertoast.showToast(msg: "Country is empty");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "Location is empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("DeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobilePhone": mobilePhone.text,
        "street": street.text,
        "village": village.text,
        "ward": ward.text,
        "district": district.text,
        "city": city.text,
        "country": country.text,
        "addressType": myType.toString(),
        "longitude": setLocation.longitude,
        "latitude": setLocation.latitude
      }).then((value) async {
        isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(msg: "Add your delivery address done!");
        await Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  //get data delivery
  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];
    DeliveryAddressModel deliveryAddressModel;

    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("DeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstName"),
        lastName: _db.get("lastName"),
        mobilePhone: _db.get("mobilePhone"),
        street: _db.get("street"),
        village: _db.get("village"),
        ward: _db.get("ward"),
        district: _db.get("district"),
        city: _db.get("city"),
        country: _db.get("country"),
        addressType: _db.get("addressType"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }
}

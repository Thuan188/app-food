import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app_order/models/user.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    User currentUser,
    String userName,
    String userEmail,
    String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userId": currentUser.uid
    });
  }

  UserModel currentData;
  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
          userEmail: value.get("userEmail"),
          userName: value.get("userName"),
          userImage: value.get("userImage"),
          userId: value.get("userId"));
      currentData = userModel;
      notifyListeners();
    }
  }
  UserModel get currentUserData{
    return currentData;
  }
}

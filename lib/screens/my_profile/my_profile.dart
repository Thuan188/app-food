import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/models/user.dart';
import 'package:food_app_order/providers/user.dart';
import 'package:food_app_order/screens/home/drawer_side.dart';

class MyProfile extends StatefulWidget {
  UserProvider userProvider;
  MyProfile({this.userProvider});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget listTile(IconData icon, String title) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      drawer: DrawerSide(
        userProvider: widget.userProvider,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 562,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData.userName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.userEmail)
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(Icons.shopping_cart_outlined, "My Orders"),
                    listTile(Icons.location_on_outlined, "My Address"),
                    listTile(Icons.person_outline, "Refer A Friends"),
                    listTile(Icons.file_copy_outlined, "Terms & Conditions"),
                    listTile(Icons.add_chart, "About"),
                    listTile(Icons.exit_to_app_outlined, "Log out")
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: scaffoldBackgroundColor,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(
                  userData.userImage ?? 'assets/avt.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

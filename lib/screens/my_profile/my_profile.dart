import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/user.dart';
import 'package:food_app_order/screens/check_out/delivery_address/delivery_details.dart';
import 'package:food_app_order/screens/home/drawer_side.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';

class MyProfile extends StatefulWidget {
  UserProvider userProvider;
  MyProfile({this.userProvider});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget listTile({IconData icon, String title, Function onTap}) {
    return Column(
      children: [
        Divider(height: 1),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: onTap,
          ),
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
        title: Text("My Profile", style: TextStyle(fontSize: 18, color: Colors.black)),
      ),
      drawer: DrawerSide(userProvider: widget.userProvider),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 42, color: primaryColor),
                Container(
                  height: 562,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            padding: EdgeInsets.only(left: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: Icon(Icons.edit_outlined, color: Colors.redAccent),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      listTile(
                          icon: Icons.shopping_cart_outlined,
                          title: "My Orders",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReviewCart(),
                            ));
                          }),
                      listTile(
                          icon: Icons.location_on_outlined,
                          title: "My Address",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DeliveryDetails(),
                            ));
                          }),
                      listTile(icon: Icons.person_outline, title: "Refer A Friends"),
                      listTile(icon: Icons.file_copy_outlined, title: "Terms & Conditions"),
                      listTile(icon: Icons.add_chart, title: "About"),
                      listTile(icon: Icons.exit_to_app_outlined, title: "Log out")
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CircleAvatar(
              radius: 45,
              child: ClipOval(
                child: Image.network(
                  userData.userImage ?? '',
                  fit: BoxFit.cover,
                  width: 85.0,
                  height: 85.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/user.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:food_app_order/screens/my_profile/my_profile.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';
import 'package:food_app_order/screens/wishlist/wish_list.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({IconData icon, String title, VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    // userData.userImage =
    // 'https://meowtel.com/img/assets/home/hero-image-cat-3.png';
    return Drawer(
      child: Container(
        width: 105,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                          child: Image.network(
                           userData.userImage ?? '',
                            fit: BoxFit.cover,
                            width: 85.0,
                            height: 85.0,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(userData.userName),
                          SizedBox(
                            height: 10,
                          ),
                          Text(userData.userEmail),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home", onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
            listTile(
                icon: Icons.shopping_bag_outlined,
                title: "Cart",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                }),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyProfile(
                            userProvider: widget.userProvider,
                          )));
                }),
            listTile(
                icon: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {}),
            listTile(
                icon: Icons.star_border_outlined,
                title: "Rating & Review",
                onTap: () {}),
            listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WishList()));
                }),
            listTile(
                icon: Icons.copy_outlined,
                title: "Raise a Complaint",
                onTap: () {}),
            listTile(
                icon: Icons.file_copy_outlined, title: "FAQs", onTap: () {}),
            Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Contact Support"),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 10),
                        child: Text("Call us: "),
                      ),
                      Text(
                        "+84 898 210 911",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3, left: 10),
                          child: Text("Mail us: "),
                        ),
                        Text(
                          "admin.food@gmail.com",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

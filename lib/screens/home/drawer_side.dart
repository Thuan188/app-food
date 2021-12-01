import 'package:flutter/material.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/screens/my_profile/my_profile.dart';
import 'package:food_app_order/screens/review_cart/review_cart.dart';

class DrawerSide extends StatelessWidget {
  DrawerSide({Key key}) : super(key: key);

  Widget listTile(IconData icon, String title, VoidCallback onTap) {
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
    return Drawer(
      child: Container(
        width: 100,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: Container(
                      width: 75,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/splash.png'),
                        radius: 40,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Guest"),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 30,
                          child: MaterialButton(
                            onPressed: () {
                            },
                            child: Text("Login"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(width: 2)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            listTile(Icons.home_outlined, "Home", () {}),
            listTile(Icons.shopping_bag_outlined, "Cart", () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ReviewCart()));
            }),
            listTile(Icons.person_outline, "My Profile", () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyProfile()));
            }),
            listTile(Icons.notifications_outlined, "Notification", () {}),
            listTile(Icons.star_border_outlined, "Rating & Review", () {}),
            listTile(Icons.favorite_outline, "Wishlist", () {}),
            listTile(Icons.copy_outlined, "Raise a Complaint", () {}),
            listTile(Icons.file_copy_outlined, "FAQs", () {}),
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

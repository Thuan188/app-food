import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_order/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app_order/helpers/colors.dart';
import 'package:food_app_order/providers/cart.dart';
import 'package:food_app_order/providers/check_out.dart';
import 'package:food_app_order/providers/product.dart';
import 'package:food_app_order/providers/user.dart';
import 'package:food_app_order/providers/wishlist.dart';
import 'package:food_app_order/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return HomeScreen();
            }
            return SignIn();
          },
        ),
      ),
    );
  }
}

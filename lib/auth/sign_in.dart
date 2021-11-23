import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app_order/screens/home.dart';
import 'package:food_app_order/services/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatelessWidget {
  //const SignIn({Key? key}) : super(key: key);
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      // userProvider.addUserData(
      //   currentUser: user,
      //   userEmail: user.email,
      //   userImage: user.photoURL,
      //   userName: user.displayName,
      // );

      return user;
    } catch (e) {
      print(e.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in to countinue',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Food Orders',
                  style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.green.shade900,
                        offset: Offset(3, 3))
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                SignInButton(
                  Buttons.Apple,
                  text: "Sign in with Apple",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {
                    _googleSignUp().then((value) =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen())));
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text('We do not use your information for any purpose.'),
                Text('You agree to our Policy.')
              ],
            )
          ],
        ),
      ),
    );
  }
}

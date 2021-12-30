import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/login/login_page/login_page_screen.dart';
import 'package:furniture_shop_app/screens/login/register_page/signup_page_screen.dart';
import 'package:furniture_shop_app/shared_component_btw_screen.dart/container_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/c1.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "LOZA",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Color(
                        0xff242A37,
                      ),
                      letterSpacing: 6.0),
                ),
                Spacer(),
                ContainerButton(
                  Title: "Sign Up",
                  submit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPageScreen()));
                  },
                  color: Colors.white,
                  txtColor: Color(0xff242A37),
                ),
                SizedBox(
                  height: 10,
                ),
                ContainerButton(
                    Title: "Login",
                    submit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPageScreen()));
                    },
                    color: Color(0xff242A37),
                    txtColor: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}

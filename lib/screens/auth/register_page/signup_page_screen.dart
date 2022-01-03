import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/auth/login_page/login_page_screen.dart';
import 'package:furniture_shop_app/screens/home/home_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({Key? key}) : super(key: key);

  @override
  State<SignupPageScreen> createState() => _SignupPageScreenState();
}

class _SignupPageScreenState extends State<SignupPageScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var addressController = TextEditingController();
  bool isloading = false;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Personal Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)
                          // .copyWith(color: Colors.black, ),
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormText(
                        control: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email can't be Empty";
                          }
                          return null;
                        },
                        label: "Email",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultFormText(
                        control: passwordController,
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is to short !";
                          }
                          return null;
                        },
                        label: "password",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultFormText(
                        control: phoneController,
                        type: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Phone can't be Empty";
                          }
                          return null;
                        },
                        label: "Phone",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultFormText(
                        control: dateOfBirthController,
                        type: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Date Of Birth can't be Empty";
                          }
                          return null;
                        },
                        label: "Date of birth",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultFormText(
                        control: addressController,
                        type: TextInputType.streetAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Address can't be Empty";
                          }
                          return null;
                        },
                        label: "Address",
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ContainerButton(
                          color: const Color(0xff242A37),
                          txtColor: Colors.white,
                          title: "SIGN UP",
                          submit: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                print(emailController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } on FirebaseAuthException catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                        title:
                                            Text(' Ops! Registration Failed'),
                                        content: Text('${e.message}')));
                              }
                            }
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account ?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPageScreen()));
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff242A37)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
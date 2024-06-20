import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/pages/home.dart';
import 'package:chatapplasttry/pages/auth/loginPage.dart';
import 'package:chatapplasttry/service/auth.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  String email = '';
  String password = '';
  String fullName = '';
  AuthServices authServices = AuthServices();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: korange,
                ),
              )
            : Form(
                key: formkey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Crystal',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Login to see what they are talking',
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/4.png'),
                            height: 250,
                          ),
                        ),
                        gap,
                        //---------------------------------------------------------------------------------------name
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: textformfieldDecoration(
                              labelText: 'Full Name', icon: Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        gap,
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: textformfieldDecoration(
                              labelText: 'Email', icon: Icons.email),
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                        ),
                        gap,
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: textformfieldDecoration(
                              labelText: 'Password', icon: Icons.lock),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        gap,
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(korange)),
                              onPressed: () {
                                register();
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Text.rich(
                          TextSpan(text: 'Already have an account', children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextPage(context, page: const loginPage());
                                },
                              text: ' Login here',
                              style: TextStyle(color: Colors.blue),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }

  register() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .registerUserWithEmailAndPassword(
              fullname: fullName, email: email, password: password)
          .then((value) async {
        if (value == true) {
//saving shared preference state
          await HelperFunctions.saveUserLOgedInStatus(isUserLoggedIn: true);
          await HelperFunctions.saveUserName(userName: fullName);
          await HelperFunctions.saveUseremail(userEmail: email);
          nextPageReplace(context, page: Home());
        } else {
          showSnackBar(context, message: value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}

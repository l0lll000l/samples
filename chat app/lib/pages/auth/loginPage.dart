import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/pages/home.dart';
import 'package:chatapplasttry/pages/auth/register.dart';
import 'package:chatapplasttry/service/auth.dart';
import 'package:chatapplasttry/service/databaseService.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String email = '';
  String password = '';
  bool _isLoading = false;
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
                            image: AssetImage('assets/1.png'),
                            height: 250,
                          ),
                        ),
                        gap,

                        //---------------------------------------------------------------------------------------email

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
                        //---------------------------------------------------------------------------------------password

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
                        //---------------------------------------------------------------------------------------elevated button

                        gap,
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(korange)),
                              onPressed: () {
                                Login();
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Text.rich(
                          TextSpan(text: 'Dont have an account', children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextPage(context, page: Register());
                                },
                              text: ' Register here',
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

  Login() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .loginWithEmailAndPassWord(email: email, password: password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email: email);
//saving values to sf
          await HelperFunctions.saveUserLOgedInStatus(isUserLoggedIn: true);
          await HelperFunctions.saveUserName(
              userName: snapshot.docs[0]['fullname']);
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

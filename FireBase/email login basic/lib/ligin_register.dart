import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp/auth/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController _PassWordController = TextEditingController();
  //-----------------------------------------------------------------------------
  Future<void> signinWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: emailController.text, password: _PassWordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

//---------------------------------------------------------------------------------
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: emailController.text, password: _PassWordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //---------------------------------------------------------------------------------
  Widget _entryfield(String title, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(labelText: title),
      controller: controller,
    );
  }

  //---------------------------------------------------------------------------------
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ?$errorMessage');
  }

  //---------------------------------------------------------------------------------
  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin
            ? signinWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'register'));
  }

  //---------------------------------------------------------------------------------
  Widget _loginOrRegister() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'register insted' : 'login insted'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          children: [
            _entryfield('email', emailController),
            _entryfield('Password', _PassWordController),
            _errorMessage(),
            _submitButton(),
            _loginOrRegister(),
          ],
        ),
      ),
    ));
  }
}

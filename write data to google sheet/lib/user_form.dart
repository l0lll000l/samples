import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/user.dart';

class UserForm extends StatefulWidget {
  final ValueChanged<User> onSavedUser;
  const UserForm({super.key, required this.onSavedUser});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController namecontroller;
  late TextEditingController emailcontroller;
  late bool isbeginner;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    this.isbeginner = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          BuildName(),
          BuildEmail(),
          IsBeginner(),
          Buildsubmit(),
        ],
      ),
    );
  }

  Widget BuildName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: namecontroller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
          hintText: 'Enter your Name',
          prefixIcon: Icon(Icons.person),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
    );
  }

  Widget BuildEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailcontroller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains('@')) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }

  Widget IsBeginner() {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('is flutter beginner'),
      value: isbeginner,
      onChanged: (bool value) {
        setState(() {
          isbeginner = value;
        });
      },
    );
  }

  Widget Buildsubmit() {
    return ElevatedButton(
        onPressed: () {
          final form = formkey.currentState!;
          final isValid = form.validate();
          if (isValid) {
            final user = User(
                name: namecontroller.text,
                email: emailcontroller.text,
                isBeginner: isbeginner);
            widget.onSavedUser(user);
          }
        },
        child: Text('save'));
  }
}

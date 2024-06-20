import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/pages/auth/loginPage.dart';
import 'package:chatapplasttry/pages/search.dart';
import 'package:chatapplasttry/service/auth.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String email;
  final String username;
  const Profile({super.key, this.email = '', this.username = ''});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //------------------------------------------------apbar
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextPage(context,
                    page: Search(
                      email: widget.email,
                      username: widget.username,
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        backgroundColor: korange,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      //----------------------------------------------body
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name'),
                    Text('Email id'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

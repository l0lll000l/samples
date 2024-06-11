import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp/auth/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('firebase');
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signoutButton() {
    return ElevatedButton(
        onPressed: () {
          user?.delete();
        },
        child: Text('Sign Out'));
  }

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _userId(),
            _signoutButton(),
            ElevatedButton(
                onPressed: () {
                  addDonor();
                },
                child: Text('ádd data')),
            Text(user!.uid.toString())
          ],
        ),
      ),
      appBar: AppBar(
        title: _title(),
      ),
    );
  }

  void addDonor() {
    final data = {
      'name': 'Athul',
      'phone': 9744690056,
      'blood': 'b-',
    };
    donor.add(data);
  }
}

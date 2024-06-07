import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/addUser.dart';

class UpdateDonor extends StatelessWidget {
  final Map arguments;
  const UpdateDonor({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    final args = arguments;

    donorName.text = args['name'];
    donorPhone.text = args['phone'];
    selectedGroop = args['blood'];
    final docId = args['id'];
    return Scaffold(
      appBar: AppBar(
          title: const Text('Update Donors'),
          backgroundColor: const Color.fromARGB(255, 138, 234, 141)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            textfield(
              donorName,
              'Name',
              'Name',
              'Search name',
              TextInputType.name,
              Icons.person,
            ),
            const SizedBox(height: 10),
            textfield(
              donorPhone,
              'Phone',
              'Phone',
              'Search Phone',
              TextInputType.phone,
              Icons.phone,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedGroop,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.bloodtype),
                  hintText: 'Blood Group',
                  labelText: 'Blood Groop',
                  border: OutlineInputBorder()),
              items: bloodGroops.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                selectedGroop = value as String?;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: const ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(color: Colors.white)),
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  UpdateDonors(docId);
                  donorName.clear();
                  donorPhone.clear();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  Widget textfield(
    controller,
    String labelText,
    String HintText,
    String returnText,
    keyboard,
    var icon,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: HintText,
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return returnText;
      //   }
      //   return null;
      // },
    );
  }
}

final bloodGroops = ['A+', 'A-', 'B-', 'B+', 'O+', 'O-', 'AB+', 'AB-'];
String? selectedGroop;
final CollectionReference donor =
    FirebaseFirestore.instance.collection('Users');
void UpdateDonors(docid) {
  final data = {
    'name': donorName.text,
    'phone': donorPhone.text,
    'blood': selectedGroop,
  };
  donor.doc(docid).update(data);
}

TextEditingController donorName = TextEditingController();
TextEditingController donorPhone = TextEditingController();

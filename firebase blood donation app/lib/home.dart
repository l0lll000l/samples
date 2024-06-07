import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_11/addUser.dart';
import 'package:flutter_application_11/update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final CollectionReference donor =
    FirebaseFirestore.instance.collection('Users');

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return AddUser();
                },
              ));
            },
            child: const Icon(Icons.add),
          ),
        ),
        appBar: AppBar(
            title: const Text('Blood Donation App'),
            backgroundColor: Colors.orange),
        body: StreamBuilder(
          stream: donor.orderBy('blood').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return UpdateDonor(
                            arguments: {
                              'name': donorSnap['name'],
                              'phone': donorSnap['phone'].toString(),
                              'blood': donorSnap['blood'],
                              'id': donorSnap.id,
                            },
                          );
                        },
                      ));
                    },
                    leading: ElevatedButton(
                        style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          // minimumSize: MaterialStatePropertyAll(Size(5, 5))
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return UpdateDonor(
                                arguments: {
                                  'name': donorSnap['name'],
                                  'phone': donorSnap['phone'].toString(),
                                  'blood': donorSnap['blood'],
                                  'id': donorSnap.id,
                                },
                              );
                            },
                          ));
                        },
                        child: Text(donorSnap['blood'] != null
                            ? donorSnap['blood']
                            : 'Error')),
                    trailing: IconButton(
                        onPressed: () {
                          deleteDonor(donorSnap.id);
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(donorSnap['name'] != null
                        ? donorSnap['name']
                        : 'no name'),
                    subtitle: Text(donorSnap['phone'].toString() != null
                        ? donorSnap['phone'].toString()
                        : 'no phone number'),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}

void deleteDonor(docId) {
  donor.doc(docId).delete();
}

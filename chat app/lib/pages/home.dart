import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/pages/auth/loginPage.dart';
import 'package:chatapplasttry/pages/profile.dart';
import 'package:chatapplasttry/pages/search.dart';
import 'package:chatapplasttry/service/auth.dart';
import 'package:chatapplasttry/service/databaseService.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/grouptile.dart';
import 'package:chatapplasttry/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '';
  String userName = '';
  Stream? groups;
  String groupName = '';
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  String getid(String res) {
    return res.substring(0, res.indexOf('_'));
  }

  String getName(String res) {
    return res.substring(res.indexOf('_') + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmail().then((value) {
      setState(() {
        email = value;
      });
    });
    await HelperFunctions.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    //getting the list of snapshots in our stream
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: korange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          popUpDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      //-----------------------------------------------------------------drawer
      drawer: Drawer(
        child: ListView(
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
            ),
            Center(
                child: Text(
              '$userName',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Center(child: Text('$email')),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: Text('Groups'),
              leading: Icon(
                Icons.groups,
                color: korange,
              ),
              selected: true,
              onTap: () {},
            ),
            //-------------------------------------------------------------profile
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: Text('Profile'),
              leading: Icon(
                Icons.person,
                color: kblack,
              ),
              onTap: () {
                nextPageReplace(context,
                    page: Profile(
                      email: email,
                      username: userName,
                    ));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: Text('LogOut'),
              leading: Icon(
                Icons.logout,
                color: kblack,
              ),
              onTap: () async {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('LogOut'),
                      content: Text("Are you sure you want to logout"),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              AuthServices().signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                builder: (context) {
                                  return loginPage();
                                },
                              ), (route) => false);
                            },
                            icon: Icon(
                              Icons.done,
                              color: Colors.green,
                            ))
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
      //---------------------------------------------------------------appBar
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextPage(context,
                    page: Search(
                      email: email,
                      username: userName,
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
          'Crystal',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      //-----------------------------------------------------------body
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [grouplist()],
      )),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Create a group',
            textAlign: TextAlign.left,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: korange,
                      ),
                    )
                  : TextField(
                      onChanged: (value) {
                        setState(() {
                          groupName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Group name',
                        labelStyle: const TextStyle(color: Colors.black),
                        hintStyle: const TextStyle(color: Colors.black),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: korange)),
                        border: const OutlineInputBorder(),
                      ),
                    ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel')),
            ElevatedButton(
                onPressed: () {
                  if (groupName != '') {
                    setState(() {
                      _isLoading = true;
                    });
                    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                        .createGroup(
                            groupName: groupName,
                            username: userName,
                            id: FirebaseAuth.instance.currentUser!.uid)
                        .whenComplete(() {
                      _isLoading = false;
                    });
                    Navigator.of(context).pop();
                    showSnackBar(context,
                        message: 'Group created successfully.');
                  }
                },
                child: Text('Create'))
          ],
        );
      },
    );
  }

  grouplist() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['groups'] != null) {
            if (snapshot.data['groups'].length != 0) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data['groups'].length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        snapshot.data['groups'].length - index - 1;
                    return GroupTile(
                        username: snapshot.data['fullname'],
                        groupId: getid(snapshot.data['groups'][reverseIndex]),
                        groupName:
                            getName(snapshot.data['groups'][reverseIndex]));
                  },
                ),
              );
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: korange,
            ),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                popUpDialog(context);
              },
              icon: Icon(
                Icons.add_circle,
                size: 70,
              )),
          gap,
          Text(
              'You have not joined in any groups, Tap on add icon to create a group'),
        ],
      ),
    );
  }
}

import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/pages/auth/loginPage.dart';
import 'package:chatapplasttry/pages/profile.dart';
import 'package:chatapplasttry/service/auth.dart';
import 'package:chatapplasttry/service/databaseService.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/chatScreen.dart';
import 'package:chatapplasttry/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  final String email;
  final String username;

  const Search({super.key, required this.email, required this.username});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String userName = '';
  User? user;
  bool isjoined = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserIdAndName();
  }

  getCurrentUserIdAndName() async {
    await HelperFunctions.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    user = FirebaseAuth.instance.currentUser;
  }

  String getName(String r) {
    return r.substring(r.indexOf('_') + 1);
  }

  bool _isLoading = false;
  QuerySnapshot? searchSnapShot;
  bool hasUserSearched = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      //----------------------------------------------------------------------body
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                controller: searchController,
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                hintText: 'Search groups',
                hintStyle: const MaterialStatePropertyAll(
                    TextStyle(color: Colors.white)),
                elevation: const MaterialStatePropertyAll(00.01),
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                trailing: {
                  IconButton(
                      onPressed: () {
                        initstateSearchMethod();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                },
              ),
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Container(child: Expanded(child: groupList())),
        ],
      ),
    );
  }

  initstateSearchMethod() async {
    if (searchController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      await DatabaseService()
          .searchByName(searchController.text)
          .then((snapshot) {
        setState(() {
          searchSnapShot = snapshot;
          _isLoading = false;
          hasUserSearched = true;
        });
      });
    }
  }

  groupList() {
    return hasUserSearched
        ? ListView.builder(
            itemBuilder: (context, index) {
              return groupTileNew(
                admin: searchSnapShot!.docs[index]['admin'],
                groupName: searchSnapShot!.docs[index]['groupName'],
                groupId: searchSnapShot!.docs[index]['groupId'],
                userName: userName,
              );
            },
            itemCount: searchSnapShot!.docs.length,
            shrinkWrap: true,
          )
        : Center(child: Text('Search Groups'));
  }

  joinedOrNot(
      String userName, String groupId, String groupName, String admin) async {
    await DatabaseService(uid: user!.uid)
        .isUserJoined(groupName, groupId, userName)
        .then((value) {
      setState(() {
        isjoined = value;
      });
    });
  }

  groupTileNew(
      {required String userName,
      required String groupId,
      required String groupName,
      required String admin}) {
    //function to check user already exist in group
    joinedOrNot(userName, groupId, groupName, admin);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        trailing: InkWell(
            onTap: () async {
              await DatabaseService(uid: user!.uid)
                  .toggleGroupJoin(groupId, userName, groupName);
              if (isjoined) {
                setState(() {
                  isjoined = !isjoined;
                });
                showSnackBar(context, message: 'Successfully joined the group');
                Future.delayed(Duration(seconds: 2), () {
                  nextPage(context,
                      page: ChatScreen(
                          username: userName,
                          groupId: groupId,
                          groupName: groupName));
                });
              } else {
                setState(() {
                  isjoined = !isjoined;
                });
                showSnackBar(context, message: 'Left the group $groupName');
              }
            },
            child: isjoined
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: korange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Joined',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: korange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Join Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),

        //------------------------------------------------------------
        subtitle: Text('Admin : ${getName(admin)}'),
        title: Text(groupName),
        leading: CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            groupName.substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          radius: 30,
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
//---------------------------------------------------------reference for collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference GroupCollection =
      FirebaseFirestore.instance.collection('Groups');

  //----------------------------------------------------------save user data
  Future saveUserData({
    required String fullname,
    required String email,
  }) async {
    return await userCollection.doc(uid).set({
      'fullname': fullname,
      'email': email,
      'groups': [],
      'profilePic': '',
      'uid': uid
    });
  }
  //---------------------------------------------------------- get userData

  Future gettingUserData({
    required String email,
  }) async {
    QuerySnapshot snapshot =
        await userCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }

  //---------------------------------------------------------------get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  //---------------------------------------------------------------creating a group
  Future createGroup({username, id, groupName}) async {
    DocumentReference documentReference = await GroupCollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': '${id}_$username',
      'members': [],
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': '',
    });
    //------------------------------------------------------------------update the member
    await documentReference.update({
      'members': FieldValue.arrayUnion(['${uid}_$username']),
      'groupId': documentReference.id,
    });
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups": FieldValue.arrayUnion(['${documentReference.id}_$groupName'])
    });
  }

  //------------------------------------------------------------------getting the chat
  getChats(String groupId) async {
    return GroupCollection.doc(groupId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = GroupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  //-------------------------------------------------------------------get members
  getGroupmembers(groupId) async {
    return GroupCollection.doc(groupId).snapshots();
  }

  //-------------------------------------------------------------------search
  searchByName(String groupName) {
    return GroupCollection.where('groupName', isEqualTo: groupName).get();
  }

  //-----------------------------------------------------------------
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userdocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userdocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains('${groupId}_$groupName')) {
      return true;
    } else {
      return false;
    }
  }

  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    // doc reference
    DocumentReference userdocumentReference = userCollection.doc(uid);
    DocumentReference groupdocumentReference = GroupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await userdocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];
    //
    if (groups.contains('${groupId}_$groupName')) {
      await userdocumentReference.update({
        'groups': FieldValue.arrayRemove(['${groupId}_$groupName'])
      });
      await groupdocumentReference.update({
        'groups': FieldValue.arrayRemove(['${uid}_$userName'])
      });
    } else {
      await userdocumentReference.update({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      });
      await groupdocumentReference.update({
        'groups': FieldValue.arrayUnion(['${uid}_$userName'])
      });
    }
  }

  //-------------------------------------------------------------------------------------send message
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    GroupCollection.doc(groupId).collection('messages').add(chatMessageData);
    GroupCollection.doc(groupId).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString()
    });
  }
}

import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/service/databaseService.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/groupInfo.dart';
import 'package:chatapplasttry/widgets/messageTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;
  final String groupId;
  final String groupName;
  const ChatScreen(
      {super.key,
      required this.username,
      required this.groupId,
      required this.groupName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String admin = '';
  TextEditingController messageController = TextEditingController();
  Stream<QuerySnapshot>? chats;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChatAndAdmin();
  }

  getChatAndAdmin() {
    DatabaseService().getChats(widget.groupId).then((value) {
      setState(() {
        chats = value;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((value) {
      setState(() {
        admin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextPageReplace(context,
                    page: GroupInfo(
                      adminName: admin,
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                    ));
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ))
        ],
        backgroundColor: korange,
        centerTitle: true,
        title: Text(
          widget.groupName,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          chatmessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: messageController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: korange)),
                              border: const OutlineInputBorder(),
                              labelText: 'Send message...',
                              labelStyle: const TextStyle(color: Colors.black),
                            ))),
                    SizedBox(width: 6),
                    Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            sendMessage();
                          },
                          icon: Icon(Icons.send),
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: korange,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  chatmessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      message: snapshot.data.docs[index]['message'],
                      sender: snapshot.data.docs[index]['sender'],
                      sentbyme: widget.username ==
                          snapshot.data.docs[index]['sender']);
                },
              )
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessage = {
        'message': messageController.text,
        'sender': widget.username,
        'time': DateTime.now().millisecondsSinceEpoch,
      };
      DatabaseService().sendMessage(widget.groupId, chatMessage);
      setState(() {
        messageController.clear();
      });
    }
  }
}

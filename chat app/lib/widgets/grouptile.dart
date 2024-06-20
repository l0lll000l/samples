import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/shared/constant.dart';
import 'package:chatapplasttry/widgets/chatScreen.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  final String username;
  final String groupId;
  final String groupName;

  const GroupTile(
      {super.key,
      required this.username,
      required this.groupId,
      required this.groupName});

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextPage(context,
            page: ChatScreen(
              username: widget.username,
              groupId: widget.groupId,
              groupName: widget.groupName,
            ));
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            widget.groupName.substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          radius: 30,
          backgroundColor: korange,
        ),
        subtitle: Text('Join the conersation as ${widget.username}'),
        title: Text(widget.groupName),
      ),
    );
  }
}

import 'package:chatapplasttry/shared/constant.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentbyme;
  const MessageTile(
      {super.key,
      required this.message,
      required this.sender,
      required this.sentbyme});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment:
            widget.sentbyme ? Alignment.bottomRight : Alignment.centerLeft,
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: widget.sentbyme ? 0 : 24,
          right: widget.sentbyme ? 24 : 0,
        ),
        margin: widget.sentbyme
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            borderRadius: widget.sentbyme
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
            color: widget.sentbyme ? korange : Colors.grey.shade700),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sender.toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              gap,
            ],
          ),
        ),
      ),
    );
  }
}

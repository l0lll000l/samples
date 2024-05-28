import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class MyCharacters extends StatefulWidget {
  const MyCharacters({super.key});

  @override
  State<MyCharacters> createState() => _MyCharactersState();
}

class _MyCharactersState extends State<MyCharacters> {
  List<MarioCharacter> characters = [];
  @override
  void initState() {
    super.initState();
    MarioCharacter.fetchAll().then((data) {
      setState(() {
        characters = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characters[index].name),
            subtitle: Text(characters[index].purpose),
            trailing: Icon(
                characters[index].isEnemy ? Icons.thumb_down : Icons.thumb_up),
            iconColor: characters[index].isEnemy ? Colors.red : Colors.green,
          );
        },
      ),
    );
  }
}





















// https://script.google.com/macros/s/AKfycbyJV9-ENvVe-NK52Nl7WzBSAv3R1oY7Xaw0v7QCw0lRdSVjsZCC8L11FuU4H79ir9uO/exec
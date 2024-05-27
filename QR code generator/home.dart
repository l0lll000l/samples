import 'package:flutter/material.dart';
import 'package:flutter_application_1/new.dart';
import 'package:flutter_application_1/search.dart';

TextEditingController urlcontroller = TextEditingController();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter rabbit number',
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.amber, width: 4),
                      borderRadius: BorderRadius.circular(12))),
              controller: urlcontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return New(
                        controller: urlcontroller.text,
                      );
                    },
                  ));
                },
                child: const Text('generate QR code')),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_9/page1.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(Provider.of<Page1>(context).test2),
          Text(Provider.of<Page1>(context).test1),
          Text(Provider.of<Page1>(context).test3)
        ],
      ),
    );
  }
}

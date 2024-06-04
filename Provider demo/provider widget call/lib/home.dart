import 'package:flutter/material.dart';
import 'package:flutter_application_9/page1.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Page1>(
              builder: (BuildContext context, value, Widget? child) {
                print('rebuild');
                return Text(value.test1);
              },
            ),
            IconButton(
                onPressed: () {
                  Provider.of<Page1>(context, listen: false).change('manga');
                },
                icon: Icon(Icons.add)),
            Provider.of<Page1>(context).widget()
          ],
        ),
      ),
    );
  }
}

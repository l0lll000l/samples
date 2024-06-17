import 'package:flutter/material.dart';

import 'package:flutter_application_23/services/databaseService.dart';
import 'package:flutter_application_23/update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List newList = [];

class _HomeState extends State<Home> {
  String? name;

  @override
  Widget build(BuildContext context) {
    newList = WholeList;
    LocalDataBase().readAllData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            newList = WholeList;
          });
          LocalDataBase().readAllData();
        },
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                      print(name);
                    });
                  },
                ),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      await LocalDataBase().addDataLocally(name: name);
                      await LocalDataBase().readAllData();
                    },
                    child: Text('save')),
              ),
              ListView.builder(
                itemCount: newList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            newList[index]['Name'] != null
                                ? newList[index]['Name']
                                : '',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return UpdateName(
                                      id: newList[index]['id'],
                                    );
                                  },
                                ));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  LocalDataBase()
                                      .deleteData(id: newList[index]['id']);
                                  newList = WholeList;
                                });
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

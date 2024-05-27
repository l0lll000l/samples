import 'package:flutter/material.dart';
import 'package:nine/model/datamodel.dart';
import 'package:nine/model/db.dart';

class ListPopUp extends StatelessWidget {
  const ListPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<contactModel> contactList,
            Widget? child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data = contactList[index];

                return ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      print(data.name);
                      if (data.id != null) {
                        deleteStudent(data.id!);
                      } else {
                        print('student id is null');
                      }
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
                  ),
                  leading: Text(
                      '${data.date!.day.toString()}${data.date!.month.toString()}'),
                  title: Text(data.name),
                  subtitle: Text(data.age),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: contactList.length);
        },
      ),
    );
  }
}

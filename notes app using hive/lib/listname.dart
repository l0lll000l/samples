import 'package:flutter/material.dart';

import 'package:nine/model/datamodel.dart';
import 'package:nine/model/db.dart';

class listStudent extends StatelessWidget {
  const listStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<contactModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              // final datenow = data.date.day
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      if (data.id != null) {
                        deleteStudent(data.id!);
                      } else {
                        print('student id is null unable to delete');
                      }
                    },
                    icon: const Icon(Icons.delete)),
                title: Text(data.name),
                subtitle: Text(data.age),
                leading: Text(
                    '${data.date?.day.toString()}-${data.date?.month.toString()}'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 10,
              );
            },
            itemCount: studentList.length);
      },
    );
  }
}

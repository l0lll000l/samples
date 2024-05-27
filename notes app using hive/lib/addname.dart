// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nine/list_popup.dart';
import 'package:nine/model/datamodel.dart';
import 'package:nine/model/db.dart';

class addStudent extends StatefulWidget {
  addStudent({super.key});

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final _namecontroller = TextEditingController();

  final _agecontroller = TextEditingController();

  final _datecontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _namecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _agecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'type something'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onTap: () {
                    _selectDate(context);
                  },
                  controller: _datecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: _selectedDate != null
                        ? DateFormat('MMMMd')
                            .format(_selectedDate) // Display formatted date
                        : 'Enter Date',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          onAddStudentButtonClicked();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('add')),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ListPopUp();
                          },
                        ));
                      },
                      icon: const Icon(
                        Icons.open_in_new,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _date = _datecontroller.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }

    // print('$_name $_age');
    final _student = contactModel(name: _name, age: _age, date: _selectedDate);
    // print(_student);
    addStudents(_student);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate ?? DateTime.now(), // Use current date if no selection
      firstDate: DateTime(2015, 8), // Optional: Set minimum selectable date
      lastDate: DateTime(2100), // Optional: Set maximum selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        // Update state for UI change
        _selectedDate = picked;
        _datecontroller.text = DateFormat('MMMMd').format(_selectedDate);
      });
    }
  }
}

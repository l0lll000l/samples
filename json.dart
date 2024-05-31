import 'dart:convert';
import 'dart:core';

void main() {
  Map<String, dynamic> json = {
    'id': '2',
    'name': 'alice',
    'course': 'science',
    'address': 'panangad',
  };

  Student s1 = Student.fromJson(json);
  print(s1.name);

  final studentjson = s1.tojson();
  print(studentjson);
}

class Student {
  String? id;
  String? name;
  String? course;
  String? address;
  Student({this.id, this.address, this.course, this.name});

//json to dart

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        address: json['address'],
        course: json['course'],
        name: json['name']);
  }

//dart to json

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;
    data['course'] = course;
    data['address'] = address;
    return data;
  }
}

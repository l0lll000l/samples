import 'package:hive_flutter/adapters.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 1)
class contactModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  DateTime? date;

  contactModel({required this.name, required this.age, this.date, this.id});
}

class UserFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String email = 'email';
  static final String isBeginer = 'isBeginer';
  static List<String> getField() => [id, name, email, isBeginer];
}

class User {
  final int? id;
  final String name;
  final String email;
  final bool isBeginner;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.isBeginner});

  User copy({
    int? id,
    String? name,
    String? email,
    bool? isBeginner,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        isBeginner: isBeginner ?? this.isBeginner,
      );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.isBeginer: isBeginner,
      };
}

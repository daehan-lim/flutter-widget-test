class User {
  String name;
  int age;

  User({required this.name, required this.age});

  User.fromJson(Map<String, dynamic> map)
    : this(name: map['name'], age: map['age']);

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age};
  }
}

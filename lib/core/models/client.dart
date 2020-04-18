class Client {
  String id;
  String name;
  String email;
  String password;
  bool isSpec;

  Client({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isSpec,
  });

  Client.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        isSpec = snapshot['isSpec'] ?? '';

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "isSpec": isSpec,
    };
  }
}

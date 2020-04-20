class Client {
  String id;
  String name;
  String email;
  String password;

  Client({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  Client.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '';

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}

class Service {
  String id;
  String name;
  double price;
  String categoryId;

  Service(this.id, this.name, this.price, this.categoryId);

  Service.formMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        price = snapshot['price'],
        categoryId = snapshot['categoryId'];

  toJson() {
    return {
      "name": name,
      "price": price,
      "categoryId": categoryId
    };
  }

}

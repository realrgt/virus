class Category {
  String id;
  String name;
  String imgUrl;

  Category({this.id, this.name, this.imgUrl});

  Category.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        imgUrl = snapshot['imgUrl'];

  toJson() {
    return {
      "name": name,
      "imgUrl": imgUrl
    };
  }
}

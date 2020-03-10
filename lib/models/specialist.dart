class Specialist {
  String name;
  String address;
  double rating;
  String imgUrl;

  Specialist({this.name, this.address, this.rating, this.imgUrl});

}

List<Specialist> specialists = [
  Specialist(
    imgUrl: 'assets/images/woman.jpg',
    name: 'Luísa Silva',
    rating: 4,
    address: 'Matola, Mozambique',
  ),
  Specialist(
    imgUrl: 'assets/images/woman1.jpg',
    name: 'Laura Alfredo',
    rating: 3,
    address: 'Nacala, Mozambique',
  ),
  Specialist(
    imgUrl: 'assets/images/woman2.jpg',
    name: 'Taynara Isabel',
    rating: 4,
    address: 'Matola, Mozambique',
  ),
  Specialist(
    imgUrl: 'assets/images/woman.jpg',
    name: 'Antónia Stark',
    rating: 4,
    address: 'Maputo, Mozambique',
  ),
];

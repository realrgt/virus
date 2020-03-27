class BookingSpot {
  String _road;
  String _number;
  String _city;
  String _neighbourhood;
  String _postalCode;

  double _latitude;
  double _longitude;

  BookingSpot();

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  String get postalCode => _postalCode;

  set postalCode(String value) {
    _postalCode = value;
  }

  String get neighbourhood => _neighbourhood;

  set neighbourhood(String value) {
    _neighbourhood = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get road => _road;

  set road(String value) {
    _road = value;
  }


}
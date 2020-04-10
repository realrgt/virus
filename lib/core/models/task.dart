import 'package:vogu/core/models/service.dart';

class Task {
  String id;
  String userId;
  String userName;
  String address;
  String latitude;
  String longitude;
  String time;
  String date;
  String specialistId;

  Task({
    this.id,
    this.userId,
    this.userName,
    this.address,
    this.latitude,
    this.longitude,
    this.time,
    this.date,
    this.specialistId,
  });

  Task.fromMap(Map snapshot, String id)
      : id = id,
        userId = snapshot['userId'],
        userName = snapshot['userName'],
        address = snapshot['address'],
        latitude = snapshot['latitude'],
        longitude = snapshot['longitude'],
        time = snapshot['time'],
        date = snapshot['date'],
        specialistId = snapshot['specialistId'];

  toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "time": time,
      "date": date,
      "specialistId": specialistId,
    };
  }
}

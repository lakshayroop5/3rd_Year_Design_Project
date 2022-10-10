import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';
import '../database/mongodb.dart';

class Room {
  String id;
  String name;
  String image;
  List<String>? time;
  List<double>? temperature;
  List<double>? humidity;

  Room(
      {required this.id,
      required this.name,
      required this.image,
      this.time,
      this.temperature,
      this.humidity});
}

class RoomList with ChangeNotifier {
  final List<Room> _rooms = [
    // Room(
    //     id: '123',
    //     name: 'Room1',
    //     image:
    //         'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    // Room(
    //     id: '123',
    //     name: 'Room1',
    //     image:
    //         'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    // Room(
    //     id: '123',
    //     name: 'Room1',
    //     image:
    //         'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    // Room(
    //     id: '123',
    //     name: 'Room1',
    //     image:
    //         'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
  ];

  List<Room> get rooms {
    return [..._rooms];
  }

  Future<void> fetchRoomData() async {
    List<Map> data = await MongoDatabase.userCollection
        .find(where.eq('name', 'room1'))
        .toList();
    print(data);
    data.forEach((element) {
      Room temp = Room(
          id: '',
          name: '',
          temperature: [],
          time: [],
          humidity: [],
          image:
              'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg');

      // finding and deleting room from list
      Room newRoom = _rooms.firstWhere((i) => i.name == element['name'],
          orElse: () => temp);

      if (newRoom.id.isEmpty) {
        newRoom.id = element['_id'].toString();
        newRoom.name = element['name'];
        newRoom.temperature?.add(element['temperature']);
        newRoom.humidity?.add(element['humidity']);
        newRoom.time?.add(element['time']);

        _rooms.add(newRoom);
      } else {
        newRoom.temperature?.add(element['temperature']);
        newRoom.humidity?.add(element['humidity']);
        newRoom.time?.add(element['time']);
      }
      // adding new room with updated details
    });
    notifyListeners();
    // return rooms;
  }

  void addRoom(Room room) {
    _rooms.add(room);
    notifyListeners();
  }

  void deleteRoom(String id) {
    _rooms.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

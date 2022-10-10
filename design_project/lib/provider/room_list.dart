import 'package:flutter/foundation.dart';

class Room {
  String id;
  String name;
  String image;

  Room({required this.id, required this.name, required this.image});
}

class RoomList with ChangeNotifier {
  final List<Room> _rooms = [
    Room(
        id: '123',
        name: 'Room1',
        image:
            'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    Room(
        id: '123',
        name: 'Room1',
        image:
            'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    Room(
        id: '123',
        name: 'Room1',
        image:
            'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
    Room(
        id: '123',
        name: 'Room1',
        image:
            'https://st4.depositphotos.com/34479534/39332/i/1600/depositphotos_393328686-stock-photo-interior-living-modern-mock-scene.jpg'),
  ];

  List<Room> get rooms {
    return [..._rooms];
  }

  List<Room> fetchRoomData() {
    return rooms;
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

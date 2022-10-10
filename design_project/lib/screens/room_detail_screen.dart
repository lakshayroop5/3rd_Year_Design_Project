import 'package:design_project/provider/room_list.dart';
import 'package:design_project/widgets/toggle_bar.dart';
import 'package:flutter/material.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room-detail';
  const RoomDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoom = ModalRoute.of(context)!.settings.arguments as Room;
    return Scaffold(
      appBar: AppBar(
        title: Text(currentRoom.name),
      ),
      body: const ToggleBar(),
    );
  }
}

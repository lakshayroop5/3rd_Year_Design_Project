import 'package:design_project/screens/room_detail_screen.dart';

import '../provider/room_list.dart';
import 'package:flutter/material.dart';

class CardHomeScreen extends StatelessWidget {
  final Room newRoom;
  const CardHomeScreen(this.newRoom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(RoomDetailScreen.routeName, arguments: newRoom),
        child: Card(
          margin: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.white,
                title: Text(
                  newRoom.name,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              child: Image.network(
                newRoom.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

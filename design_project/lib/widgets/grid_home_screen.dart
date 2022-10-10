import 'package:design_project/provider/room_list.dart';
import 'package:design_project/widgets/card_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridHomeScreen extends StatelessWidget {
  const GridHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roomData = Provider.of<RoomList>(context);
    final loadedRooms = roomData.rooms;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 0,
        childAspectRatio: 3 / 2,
      ),
      itemCount: loadedRooms.length,
      itemBuilder: (ctx, i) => CardHomeScreen(loadedRooms[i]),
    );
  }
}

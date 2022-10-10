import 'package:design_project/provider/room_list.dart';
import 'package:design_project/widgets/card_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridHomeScreen extends StatefulWidget {
  const GridHomeScreen({super.key});

  @override
  State<GridHomeScreen> createState() => _GridHomeScreenState();
}

class _GridHomeScreenState extends State<GridHomeScreen> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<RoomList>(context).fetchRoomData();
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

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

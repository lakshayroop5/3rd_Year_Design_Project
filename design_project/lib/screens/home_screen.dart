import 'package:design_project/screens/add_room_screen.dart';
import 'package:design_project/widgets/grid_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void startAddNewRoom(BuildContext ctx) {
      showModalBottomSheet(
        context: context,
        builder: (context) => const AddNewRoom(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Project'),
      ),
      // body: Center(
      //   child: CircularProgressIndicator(),
      // ),
      body: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          GridHomeScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () => startAddNewRoom(context),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}

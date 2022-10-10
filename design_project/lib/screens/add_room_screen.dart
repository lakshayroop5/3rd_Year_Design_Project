import 'package:flutter/material.dart';

class AddNewRoom extends StatefulWidget {
  const AddNewRoom({super.key});

  @override
  State<AddNewRoom> createState() => _AddNewRoomState();
}

class _AddNewRoomState extends State<AddNewRoom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          child: ListView(
        children: [
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
                label: Text('Room Name'),
                labelStyle: TextStyle(color: Colors.purple)),
          ),
        ],
      )),
    );
  }
}

import 'package:design_project/database/mongodb.dart';
import 'package:design_project/provider/room_list.dart';
import 'package:design_project/screens/home_screen.dart';
import 'package:design_project/screens/room_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => RoomList()),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const HomeScreen(),
        routes: {
          RoomDetailScreen.routeName: (context) => const RoomDetailScreen(),
        },
      ),
    );
  }
}

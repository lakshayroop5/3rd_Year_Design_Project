import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import './connection.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(url);
    await db.open();
    // inspect(db);
    userCollection = db.collection(user_collection);
  }
}

// how to create function to get data
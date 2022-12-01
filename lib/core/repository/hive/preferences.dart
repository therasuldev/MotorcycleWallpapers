import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  static var db = Hive.box('Favorite');
  Future<dynamic> saveItem(String key, String value) async {
    var result = await db.put(key, value);
    return result;
  }

  Future<dynamic> getItems() async {
    var keys = db.keys.toList();
    var values = db.values.toList();
    

    var allItems = [
      [...keys],
      [...values]
    ];
    return allItems;
  }

  Future<dynamic> removeItem(String key) async {
    db.delete(key);

    var keys = db.keys.toList();
    var values = db.values.toList();

    var allItems = [
      [...keys],
      [...values]
    ];
    return allItems;
  }
}

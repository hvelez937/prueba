import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba/modelo/mod_post.dart';

class HiveDatabase {
  late Box boxPost;

  static HiveDatabase? _instance;

  HiveDatabase._internal();

  static HiveDatabase get instance {
    _instance ??= HiveDatabase._internal();
    return _instance!;
  }

  Future<bool> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    await Future.sync(() => Hive.registerAdapter(PostAdapter()));
    boxPost = await Hive.openBox<Post>("postbd");
    return true;
  }
}

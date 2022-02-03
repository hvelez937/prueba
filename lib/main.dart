import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/provider/provider_post.dart';
import 'package:prueba/ui/list_post.dart';
import 'package:prueba/utilidades/hive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HiveDatabase localDatabase = HiveDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PostProvider()..init()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Estudio Alfa',
          home: FutureBuilder(
            future: localDatabase.initDatabase(),
            builder: (BuildContext context, AsyncSnapshot<bool> snap) {
              if (snap.data != null) {
                return PostPage();
              } else {
                return const Scaffold(
                  body: Center(child: Text("Powered")),
                );
              }
            },
          ),
          //    routes: buildAppRoutes(),
        ));
  }
}

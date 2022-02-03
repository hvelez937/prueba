import 'package:flutter/material.dart';
import 'package:prueba/api/api_post.dart';
import 'package:prueba/modelo/mod_post.dart';
import 'package:prueba/utilidades/hive.dart';

class PostProvider extends ChangeNotifier {
  HiveDatabase localDatabase = HiveDatabase.instance;
  late Post usuario = localDatabase.boxPost.getAt(0);

  late String mensaje;
  bool isLoading = false;
  late bool error;
  var listaPost = [];
  late bool _isUploading;

  bool get isUploading => _isUploading;

  void init() async {
    if (localDatabase.boxPost.isEmpty) {
      cargarlista();
    }
    notifyListeners();
  }

  insertPost(Post post) {
    localDatabase.boxPost.add(post);
    listaPost.add(post);
    notifyListeners();
  }

  cargarlista() async {
    //Se llama el api
    await PostApi().consultaApi().then((listaPost) {
      // ignore: avoid_function_literals_in_foreach_calls
      listaPost.forEach((post) => insertPost(post));
      mensaje = "Se realizo la sincronizacion correctamente!";
      notifyListeners();
    }).catchError((e) {
      mensaje = "No se lograron enviar los datos al servidor";
      notifyListeners();
    });
  }

  Future retornaDatos() async {
    if (localDatabase.boxPost.isNotEmpty) {
      return listaPost;
    }
  }
}

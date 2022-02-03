import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/modelo/mod_post.dart';
import 'package:prueba/provider/provider_post.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Detalle")),
        body: Container(
          padding: const EdgeInsets.all(3.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.address!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.company!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.eyeColor!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.gender!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.phone!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.post.about!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ],
          ),
        ));
  }
}

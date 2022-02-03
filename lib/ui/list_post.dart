import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/modelo/mod_post.dart';
import 'package:prueba/provider/provider_post.dart';
import 'package:prueba/ui/detalle.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar:
            AppBar(centerTitle: true, title: const Text("Lista de Personas")),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(3.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: postProvider.retornaDatos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Expanded(
                      child: ListView.builder(
                          itemCount: postProvider.listaPost.length,
                          itemBuilder: (context, index) {
                            Post post = postProvider.listaPost[index];

                            return Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.orange,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /* SizedBox(
                                      height: 25.0,
                                      child: Text(post.name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0)),
                                    ),*/
                                    SizedBox(
                                      height: 25.0,
                                      child: Row(
                                        children: [
                                          Image.network(post.picture),
                                          Text(post.name,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.0,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: Colors.black,
                                            size: 25.0,
                                          ),
                                          Text(post.email,
                                              style: const TextStyle(
                                                  fontSize: 15.0)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: const Text('VER DETALLE'),
                                          style: TextButton.styleFrom(
                                              // primary: green,
                                              ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetallePage(post: post),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ));
  }
}

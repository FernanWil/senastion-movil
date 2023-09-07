import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movil_senastion/models/models.dart';

var url = Uri.parse(
    "https://48e7-2800-e2-d80-cfb-8f6-202a-f6d8-ab84.ngrok.io/api/usuarios");
List<Usuario> usuariosList = [];

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  State<Usuarios> createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  @override
  void initState() {
    super.initState();
    getUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Senastion"),
          backgroundColor: const Color.fromARGB(255, 28, 200, 54)),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: usuariosList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => DetallePais(heroTag: index)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 470,
                                    color:
                                        const Color.fromARGB(255, 36, 36, 36),
                                    child: Row(
                                      children: [
                                        // Image.network(
                                        //   harryList[index].image,
                                        //   width: 160,
                                        // ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          usuariosList[index].nombre,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0),
                                              fontSize: 20),
                                        )
                                      ],
                                    )),
                              ],
                            )),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void getUsuario() async {
    final response = await get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      print(data);
      for (var i in data) {
        setState(() {
          usuariosList.add(Usuario(
            i['documento'],
            i['nombre'],
            i['apellidos'],
            i['email'],
            i['telefono'],
          ));
        });
      }
    }
  }
}

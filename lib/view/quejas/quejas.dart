import 'package:flutter/material.dart';
import 'package:movil_senastion/models/models.dart';
import 'package:dio/dio.dart';
import 'package:movil_senastion/view/login/controller.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Quejas extends StatefulWidget {
  const Quejas({super.key});

  @override
  State<Quejas> createState() => _QuejasState();
}

class _QuejasState extends State<Quejas> {
  List<Queja> quejas = [];

  @override
  void initState() {
    super.initState();
    _loadQuejas();
  }

  @override
  Widget build(BuildContext context) {
    // AuthLogin loginController = AuthLogin();
    return Scaffold(
        appBar: AppBar(
            title: const Text("Senastion",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'linda')),
            backgroundColor: const Color.fromARGB(255, 7, 197, 20)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: quejas.length,
            itemBuilder: (BuildContext context, int index) {
              final queja = quejas[index];
              Map<String, dynamic>? userInfo = AuthState().decodedToken;

              if (userInfo != null) {
                for (var i in quejas) {
                  // print(userInfo['quejasUsuarios']);
                  for (var f in userInfo['quejasUsuarios']) {
                    Queja quejaToken = Queja.fromJson(f);
                    print("Id token: ${queja}");
                    // print("Documento usuario queja: ${i.usuarioQueja?.documento}");
                    print("TOken descodificado de quejas: $userInfo");
                    // String documento = userInfo['quejasUsuarios'].idQueja ?? '';
                    // print("Token documento $documento");
                    // String? documentoU = queja.usuarioQueja?.documento;
                    // print("QUeja Documento $documentoU");
                    if (i.idQueja == quejaToken.idQueja) {
                      print("Quejas mami");
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetalleQuejas(
                                      heroTag: index,
                                      queja: queja,
                                    )));
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
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                              elevation: 0,
                                              color: const Color.fromARGB(
                                                  255, 235, 235, 235),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: Colors.black,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: SizedBox(
                                                width: 376,
                                                height: 280,
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            20),
                                                    // color: const Color.fromARGB(
                                                    //     255, 180, 180, 180),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        // CircleAvatar(
                                                        //   child: Text(
                                                        //     queja.aprendizQueja.nombre
                                                        //         .substring(0, 1),
                                                        //   ),
                                                        // ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        const Text(
                                                          "Nombre del Aprendiz:",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            "${queja.aprendizQueja?.nombre} ${queja.aprendizQueja?.apellidos}"),
                                                        const SizedBox(
                                                            height: 10),

                                                        const Text(
                                                          "Ficha del Aprendiz: ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            "${queja.aprendizQueja?.fichaAprendiz?.codigoFicha}"),
                                                        const SizedBox(
                                                            height: 10),

                                                        const Text(
                                                          "Descripción Motivo del Aprendiz",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            "${queja.descripcionMotivo}"),
                                                        const SizedBox(
                                                            height: 10),
                                                      ],
                                                    )),
                                              ))
                                        ],
                                      )),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ));
                    } else {
                      print("NO hay quejas");
                    }
                  }
                }
              } else {
                print("En quejas el token no se descodificó bien");
              }
            },
          ),
        ));
  }

  Future<void> _loadQuejas() async {
    try {
      final response = await Dio()
          .get("https://apidesplegar-production.up.railway.app/api/quejas");
      print(response);
      print("1 y 2");
      if (response.statusCode == 200) {
        print(response.statusCode);
        if (response.data != null) {
          print("Entró");
          final List<dynamic> quejasData = response.data ?? [];
          print("Quejas Data: $quejasData");
          // quejasData;
          // quejas = Queja.fromJson(response.data);
          print("2 y 3 ");
          setState(() {
            // this.quejas = quejas;
            quejas = quejasData.map((data) => Queja.fromJson(data)).toList();
            print("Quejas setState: $quejas");
          });
        }
      } else {
        throw Exception("Error, no se pudieron cargar los datos.");
      }
    } catch (e) {
      print("Error al obtner data: $e");
    }
  }
}

// Future accessTokenData() async {
//   final token = await readToken(); // Llama a la función para obtener el token

//   if (token != null) {
//     Map<String, dynamic> decodedToken = Jwt.parseJwt(token);

//     // Ahora puedes acceder a los datos contenidos en el token
//     String username = decodedToken['documento'];
//     int userId = decodedToken['rolUsuario']["nombreRol"];

//     print('Username: $username');
//     print('User ID: $userId');
//   } else {
//     print('No se encontró ningún token en el almacenamiento seguro.');
//   }
// }

class DetalleQuejas extends StatelessWidget {
  final int heroTag;
  final Queja queja;
  const DetalleQuejas({Key? key, required this.heroTag, required this.queja})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de Queja",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'linda')),
        backgroundColor: const Color.fromARGB(255, 7, 197, 20),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                    child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 235, 235, 235),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: SizedBox(
                        width: 376,
                        height: 500,
                        child: Container(
                            margin: EdgeInsets.all(20),
                            // color: const Color.fromARGB(
                            //     255, 180, 180, 180),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                // CircleAvatar(
                                //   child: Text(
                                //     queja.aprendizQueja.nombre
                                //         .substring(0, 1),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Nombre del Aprendiz:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "${queja.aprendizQueja?.nombre} ${queja.aprendizQueja?.apellidos}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Ficha del Aprendiz: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "${queja.aprendizQueja?.fichaAprendiz?.codigoFicha}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Descripción Motivo del Aprendiz",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${queja.descripcionMotivo}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Motivo Queja del Aprendiz",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${queja.motivoQueja?.nombreMotivo}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Estado de la Queja del Aprendiz",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "${queja.estadoQueja?.nombreEstadoQuejas}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Codigo del Comité",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${queja.comiteQueja?.codigoComite}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Decision Queja del Aprendiz",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${queja.decisionQueja?.nombreDecision}"),
                                const SizedBox(height: 10),

                                const Text(
                                  "Resultado de Aprendizaje",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${queja.resultadoAQueja?.nombreRa}"),
                                const SizedBox(height: 10),
                              ],
                            )),
                      ))
                ])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

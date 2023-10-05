import 'package:flutter/material.dart';
import 'package:movil_senastion/models/modelComite.dart';
import 'package:dio/dio.dart';
import 'package:movil_senastion/components/token.dart';
import 'package:movil_senastion/models/models.dart';
import 'package:movil_senastion/view/login/controller.dart';

class Comites extends StatefulWidget {
  const Comites({super.key});

  @override
  State<Comites> createState() => _ComitesState();
}

class _ComitesState extends State<Comites> {
  List<Comite> comites = [];
  List<Token> tokens = [];

  @override
  void initState() {
    super.initState();
    // getQuejas();
    _loadComite();
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: comites.length,
            itemBuilder: (BuildContext context, int index) {
              final comite = comites[index];
              dynamic userInfo = AuthState().decodedToken;
              if (userInfo != null) {
                for (var i in comites) {
                  for (var f in userInfo['quejasUsuarios']) {
                    Queja quejaToken = Queja.fromJson(f);
                    // String codigo = codigoComiteUsuario.map(i);
                    final codigoComiteUsuario = comite.codigoComite;
                    print("TOken descodificado de Comité: $userInfo");
                    print("Documento del usuairo: $codigoComiteUsuario");
                    // int documento = userInfo['quejasUsuarios']["comiteQueja"]["codigoComite"] ?? '';
                    // print("DOcumento comite: $documento");
                    if (i.codigoComite == quejaToken.comiteQueja?.codigoComite) {
                      print("Hola");
                      return InkWell(
                          // onTap: () {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => DetalleComite(
                          //             heroTag: index,
                          //             // comite: comite,
                          //           )));
                          // },
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
                                          color: Color.fromARGB(
                                              255, 235, 235, 235),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                          ),
                                          child: SizedBox(
                                            width: 376,
                                            height: 270,
                                            child: Container(
                                                margin: EdgeInsets.all(20),
                                                // color: const Color.fromARGB(
                                                //     255, 180, 180, 180),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Text(
                                                      "Codigo del Comité:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(comite.codigoComite),
                                                    const SizedBox(height: 10),
                                                    const Text(
                                                      "Link del Comité: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    // Text(),
                                                    const SizedBox(height: 10),
                                                    const Text(
                                                      "Fecha Inicio:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        "${comite.fechaHoraInicio}"),
                                                    const SizedBox(height: 10),

                                                    const Text(
                                                      "Fecha Final:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        "${comite.fechaHoraFin}"),
                                                    const SizedBox(height: 10),
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
                      print("NO hay comites");
                    }
                  }
                }
              } else {
                print(
                    "El token en Comité no se pudo descodificar correctamente");
              }
              
            },
          ),
        ));
  }

  Future _loadComite() async {
    final response = await Dio()
        .get("https://apidesplegar-production.up.railway.app/api/comite");
    // final responseToken = await Dio().get("https://apidesplegar-production.up.railway.app/api/acceso/auth");
    if (response.statusCode == 200) {
      final List<dynamic> comitesData = response.data;
      // final List<dynamic> tokenData = responseToken.data;
      print("Comité: $comitesData");
      // print("Token: $tokenData");
      // quejasData;
      // quejas = Queja.fromJson(response.data);
      print("2 y 3 ");
      setState(() {
        comites = comitesData.map((data) => Comite.fromJson(data)).toList();
        print("Comité: $comites");
        // tokens = tokenData.map((i) => Token.fromJson(i)).toList();
        // print("Token: $tokens");
      });
    } else {
      throw Exception("Error, no se pudieron cargar los datos.");
    }

    // setState(() {});
  }
}

// class DetalleComite extends StatelessWidget {
//   final int heroTag;
//   // final Comite comite;
//   const DetalleComite({
//     Key? key,
//     required this.heroTag,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Detalle del Comité",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         backgroundColor: const Color.fromARGB(255, 7, 197, 20),
//       ),
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Hero(
//                 // tag: heroTag,
//                 child: ClipRRect(
//                     child: Column(children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Card(
//                       elevation: 0,
//                       color: Color.fromARGB(255, 235, 235, 235),
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: Colors.black,
//                         ),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(15)),
//                       ),
//                       child: SizedBox(
//                         width: 376,
//                         height: 500,
//                         child: Container(
//                             margin: EdgeInsets.all(20),
//                             // color: const Color.fromARGB(
//                             //     255, 180, 180, 180),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 // CircleAvatar(
//                                 //   child: Text(
//                                 //     queja.aprendizQueja.nombre
//                                 //         .substring(0, 1),
//                                 //   ),
//                                 // ),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),

//                                 const Text(
//                                   "Codigo del Comité",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 // Text(comite.codigoComite),
//                                 const SizedBox(height: 10),

//                                 const Text(
//                                   "Fecha y hora Inicio:",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 // Text("${comite.fechaHoraInicio}"),
//                                 const SizedBox(height: 10),

//                                 const Text(
//                                   "Fecha y hora final: ",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 // Text("${comite.fechaHoraInicio}"),
//                                 const SizedBox(height: 10),

//                                 const Text(
//                                   "Promgrama Formativo",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 // Text(comite.pcaComite.programaFormativo.nombrePf),
//                                 const SizedBox(height: 10),

//                                 const Text(
//                                   "Codigo Programa Formativo",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 // Text(comite.pcaComite.programaFormativo.codigoPf),
//                                 const SizedBox(height: 10),

//                                 // const Text(
//                                 //   "Estado de la Queja del Aprendiz",
//                                 //   style: TextStyle(fontWeight: FontWeight.bold),
//                                 // ),
//                                 // Text(queja.estadoQueja.nombreEstadoQuejas),
//                                 // const SizedBox(height: 10),

//                                 // const Text(
//                                 //   "Decision Queja del Aprendiz",
//                                 //   style: TextStyle(fontWeight: FontWeight.bold),
//                                 // ),
//                                 // Text(queja.decisionQueja.nombreDecision),
//                                 // const SizedBox(height: 10),

//                                 // const Text(
//                                 //   "Resultado de Aprendizaje",
//                                 //   style: TextStyle(fontWeight: FontWeight.bold),
//                                 // ),
//                                 // Text(queja.resultadoAQueja.nombreRa),
//                                 // const SizedBox(height: 10),
//                               ],
//                             )),
//                       ))
//                 ])),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

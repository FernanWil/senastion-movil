import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil_senastion/models/models.dart';


var url = Uri.parse("https://ff71-2800-e2-d80-cfb-8f6-202a-f6d8-ab84.ngrok.io/api/quejas");
List<Queja> quejaList = [];

class Quejas extends StatefulWidget {
  const Quejas({super.key});

  @override
  State<Quejas> createState() => _QuejasState();
}

class _QuejasState extends State<Quejas> {
  @override
  void initState() {
    getQuejas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Senastion", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 7, 197, 20)
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: quejaList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetallePais(heroTag: index)));
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
                                    color: Color.fromARGB(255, 180, 180, 180),
                                    child: Row(
                                      children: [
                                        // Image.network(
                                        //   quejaList[index].image,
                                        //   width: 160,
                                        // ),
                                        const  SizedBox(height: 20,),
                                        Text(
                                          'Aprendiz: ',
                                          style: const  TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                                        ),
                                        Text(
                                          'Descrición: ${quejaList[index].descripcionMotivo}',
                                          style: const  TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                                        ),
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

  void getQuejas() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      for (var i in data) {
          setState(() {
            quejaList.add(Queja(i['descripcionMotivo']));
          });
      }
    }
  }
}

class DetallePais extends StatelessWidget {
  final int heroTag;
  const DetallePais({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Información Queja"),backgroundColor:  Color.fromARGB(255, 7, 197, 20),),
      backgroundColor:Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                    child: Column(children: [
                     const  SizedBox(height: 30,),
                  Container(
                      color: Color.fromARGB(255, 177, 177, 177),
                      height: 250,
                      width: 500,
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          // CircleAvatar(
                          //   backgroundImage: NetworkImage(
                          //     (harryList[heroTag].image),
                          //   ),
                          //   radius: 50,
                          // ),
                          const SizedBox(height: 30,),

                          Text(
                            "Descripción: ${quejaList[heroTag].descripcionMotivo}",
                            style:const  TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                        //   const SizedBox(
                        //     width: 30,
                        //   ),
                        //   Text(
                        //     "Genero: ${harryList[heroTag].gender}",
                        //     style: const TextStyle(
                        //         color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 18),
                        //   ),
                        //  const  SizedBox(
                        //     width: 30,
                        //   ),
                        //   Text(
                        //     "Especie: ${harryList[heroTag].species}",
                        //     style:const  TextStyle(
                        //         color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 18),
                        //   ),
                        //   Text(
                        //     "Casa: ${harryList[heroTag].house}",
                        //     style:const  TextStyle(
                        //         color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 18),
                        //   ),
                        ],
                      )),
                ])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'dart:convert';
// // import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:movil_senastion/models/models.dart';
// import 'package:http/http.dart';

// var url = Uri.parse("https://48e7-2800-e2-d80-cfb-8f6-202a-f6d8-ab84.ngrok.io/api/quejas");
// List<Queja> quejaList = [];

// class Quejas extends StatefulWidget {
//   const Quejas({super.key});

//   @override
//   State<Quejas> createState() => _QuejasState();
// }

// class _QuejasState extends State<Quejas> {
//   @override
//   void initState() {
//     getQuejas();
//     super.initState();
//   }

//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Senastion")),
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 500),
//           child: ListView.builder(
//             itemCount: quejaList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {
//                   /* Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => SecondPage(heroTag: index))); */
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Hero(
//                         tag: index,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           // child: Image.network(
//                           //   quejaList[index].image,
//                           //   width: 200,
//                           // ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                           child: Text(
//                         'Descripcion:${quejaList[index].descripcionMotivo}',
//                         style: Theme.of(context).textTheme.headline6,
//                       )),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: const Text("Senastion", style: TextStyle(color: Colors.white),),
  //         backgroundColor: const Color.fromARGB(255, 0, 179, 12)),
  //     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  //     body: Center(
  //       child: Container(
  //         constraints: const BoxConstraints(maxWidth: 500),
  //         child: ListView.builder(
  //           itemCount: quejaList.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return InkWell(
  //               onTap: () {
  //                 Navigator.of(context).push(MaterialPageRoute(
  //                     builder: (context) => QuejaDetails(heroTag: index)));
  //               },
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Row(
  //                   children: [
  //                     Text('data'),
  //                     Hero(
  //                       tag: index,
  //                       child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(8),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: [
  //                               Container(
  //                                   width: 470,
  //                                   color:
  //                                       const Color.fromARGB(255, 36, 36, 36),
  //                                   child: Row(
  //                                     children: [
  //                                       Text(
  //                                         'Description:',
  //                                         style: const TextStyle(
  //                                             fontWeight: FontWeight.bold,
  //                                             color: Color.fromARGB(
  //                                                 255, 255, 255, 255),
  //                                             fontSize: 20),
  //                                       ),
  //                                       const SizedBox(
  //                                         height: 20,
  //                                       ),
  //                                       // Text(
  //                                       //   'HOla ${quejaList[index].idQueja}',
  //                                       //   style: const TextStyle(
  //                                       //       fontWeight: FontWeight.bold,
  //                                       //       color: Color.fromARGB(
  //                                       //           255, 255, 255, 255),
  //                                       //       fontSize: 20),
  //                                       // )
  //                                     ],
  //                                   )),
  //                             ],
  //                           )),
  //                     ),
  //                     const SizedBox(width: 10),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   void getQuejas() async {
//     final response = await get(url);
//     if (response.statusCode == 200) {
//       String body = utf8.decode(response.bodyBytes);
//       final data = jsonDecode(body);
//       for (var i in data) {
//         setState(() {
//           quejaList.add(Queja(
//               i['idQueja'],
//               i['competenciaQueja'],
//               i['aprendizQueja'],
//               i['usuarioQueja'],
//               i['descripcionMotivo'],
//               i['motivoQueja'],
//               i['estadoQueja'],
//               i['competenciaQueja'],
//               i['resultadoAQueja'],
//               i['comiteQueja'],
//               i['decisionQueja']
//               ));
//         });
//       }
//     }
//   }
// }

// class QuejaDetails extends StatelessWidget {
//   final int heroTag;
//   const QuejaDetails({Key? key, required this.heroTag}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Detalle"),
//         backgroundColor: const Color.fromARGB(255, 36, 36, 36),
//       ),
//       backgroundColor: const Color.fromARGB(255, 114, 114, 114),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Hero(
//                 tag: heroTag,
//                 child: ClipRRect(
//                     child: Column(children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       color: const Color.fromARGB(255, 47, 47, 47),
//                       height: 250,
//                       width: 500,
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           // CircleAvatar(
//                           //   backgroundImage: NetworkImage(
//                           //     (quejaList[heroTag].estadoQueja),
//                           //   ),
//                           //   radius: 50,
//                           // ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Text(
//                             'Nombre: ${quejaList[heroTag].aprendizQueja}',
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           const SizedBox(
//                             width: 30,
//                           ),
//                           // Text(
//                           //   "Genero: ${quejaList[heroTag].gender}",
//                           //   style: TextStyle(
//                           //       color: Color.fromARGB(255, 255, 255, 255),
//                           //       fontWeight: FontWeight.bold,
//                           //       fontSize: 18),
//                           // ),
//                           // SizedBox(
//                           //   width: 30,
//                           // ),
//                           // Text(
//                           //   "Especie: ${quejaList[heroTag].species}",
//                           //   style: TextStyle(
//                           //       color: Color.fromARGB(255, 255, 255, 255),
//                           //       fontWeight: FontWeight.bold,
//                           //       fontSize: 18),
//                           // ),
//                           // Text(
//                           //   "Casa: ${quejaList[heroTag].house}",
//                           //   style: TextStyle(
//                           //       color: Color.fromARGB(255, 255, 255, 255),
//                           //       fontWeight: FontWeight.bold,
//                           //       fontSize: 18),
//                           // ),
//                         ],
//                       )),
//                 ])),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class Quejas extends StatefulWidget {
//   const Quejas({super.key});

//   @override
//   State<Quejas> createState() => _QuejasState();
// }

// class _QuejasState extends State<Quejas> {
//   late Future<List<Queja>> _listadoQueja;

//   Future<List<Queja>> _getQuejas() async {
//     //the body might complete normally, causing 'null' to be returned, but the return type,<List<Queja>>, is a potentially non-nullable type. Try adding either a return or a throw astatement at the end.

//     final response = await http.get(Uri.parse(
//         "http://localhost:3000/api/quejas")); //the argument type 'string' can't be assigned to the parameter type 'Uri'
//     List<Queja> quejas = [];
 
//     if (response.statusCode == 200) {
//       String body = utf8.decode(response.bodyBytes);
//       final jsonData = jsonDecode(body);

//       print(jsonData);
//       // for (var i in jsonData) {
//       //   // quejas.add(
//       //   //   // Queja(trimestre, aprendiz, usuario, descripcion, motivoQ, estadoQ, competencia, resultado, comiteQueja, decision);
//       //   // );
//       // }
//       } else {
//       throw Exception("Falló la conexión ");
//     }
//       return quejas;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _listadoQueja = _getQuejas();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

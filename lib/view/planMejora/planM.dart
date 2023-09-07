import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil_senastion/models/models.dart';


var url = Uri.parse("https://ff71-2800-e2-d80-cfb-8f6-202a-f6d8-ab84.ngrok.io/api/quejas");
List<Queja> quejaList = [];

class PlanM extends StatefulWidget {
  const PlanM({super.key});

  @override
  State<PlanM> createState() => _PlanMState();
}

class _PlanMState extends State<PlanM> {
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
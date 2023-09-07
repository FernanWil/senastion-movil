
import 'package:flutter/material.dart';
import 'package:movil_senastion/view/perfil/perfil.dart';
import 'package:movil_senastion/view/planMejora/planM.dart';
import 'package:movil_senastion/view/quejas/quejas.dart';




class BarraInferior extends StatefulWidget {
  const BarraInferior({super.key});

  @override
  State<BarraInferior> createState() => BarraInferiorState();
}

class BarraInferiorState extends State<BarraInferior> {
  // ignore: non_constant_identifier_names
  int _actuaPage = 0;
  // ignore: prefer_final_fields, non_constant_identifier_names
  List<Widget> _Pages = [
    const Quejas(),
    const PlanM(),
    const Usuarios(),
  ];
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: _Pages[_actuaPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _actuaPage = index;
          });
        },
        currentIndex: _actuaPage,
        items: const [ 
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Quejas"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Plan Mejoramiento"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Usuarios"),
          // BottomNavigationBarItem(icon: Icon(Icons.logout),label: "Salir")

          ],
        ),  
    );
  }

}
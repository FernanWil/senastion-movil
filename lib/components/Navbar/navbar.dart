
import 'package:flutter/material.dart';
import 'package:movil_senastion/view/perfil/perfil.dart';
import 'package:movil_senastion/view/comite/comite.dart';
import 'package:movil_senastion/view/quejas/quejas.dart';




class BarraInferior extends StatefulWidget {
  const BarraInferior({super.key});

  @override
  State<BarraInferior> createState() => BarraInferiorState();
}

class BarraInferiorState extends State<BarraInferior> {
  final _formKey = GlobalKey();
  // ignore: non_constant_identifier_names
  int _actuaPage = 0;
  // ignore: prefer_final_fields, non_constant_identifier_names
  List<Widget> _Pages = [
    const Quejas(),
    const Comites(),
    const Usuarios(),
  ];
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: _Pages[_actuaPage],
      key: _formKey,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _actuaPage = index;
          });
        },
        currentIndex: _actuaPage,
        items: const [ 
          BottomNavigationBarItem(icon: Icon(Icons.assignment_late_outlined),label: "Quejas"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined),label: "Comité de Evaluación"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: "Perfíl"),
          // BottomNavigationBarItem(icon: Icon(Icons.logout),label: "Salir")

          ],
        ),  
    );
  }

}

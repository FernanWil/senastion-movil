import 'package:flutter/material.dart';
import 'package:movil_senastion/view/login/login.dart';
// import 'package:movil_senastion/view/quejas/quejas.dart';
// import 'package:movil_senastion/view/quejas/quejas.dart';
// import 'package:movil_senastion/view/perfil/perfil.dart';
// import 'package:movil_senastion/view/quejas/quejas.dart';
// import 'package:movil_senastion/components/Navbar/navbar.dart';
// import 'package:movil_senastion/models/models.dart';
// import 'package:movil_senastion/view/quejas/quejas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senastion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 58, 58)),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
    );
  }
}

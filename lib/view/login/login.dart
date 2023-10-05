import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movil_senastion/components/Navbar/navbar.dart';
import 'package:movil_senastion/models/modelUsuario.dart';
import 'package:movil_senastion/view/login/controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<Usuario> usuarios = [];
  String msg = "";

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _Documento = TextEditingController();
  final _Contrasena = TextEditingController();
  String correo = "";
  String pass = "";
  String mensaje = "";
  bool valida = true;
  @override
  Widget build(BuildContext context) {
    AuthLogin loginController = AuthLogin();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 207, 207),
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/login_form.jpg",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [  
          const SizedBox(height: 70,),
              Container(
                margin: EdgeInsets.all(.0),
                child: const Text(
                  "SENASTION",
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 197, 20),
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'linda',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.all(18),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 400,
                        height: 310,
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.center,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      // keyboardType:  TextInputType.emailAddress,
                                      controller: loginController.documentoController,
                                      decoration: InputDecoration(
                                          labelText: "Documento",
                                          border: OutlineInputBorder(),
                                          prefix: Icon(Icons.email)),
                                      validator: (value) {
                                        // if(value != loginController.alue != loginController.constrasenaController){
                                        //   return "Credenciales incorrectas";
                                        // }
                                        // if(value < 11){
                                        //   return "Contraseña incorrecta";
                                        // }
                                        if (value!.isEmpty) {
                                          return "Ingrese su Documento";
                                        }
                                        if (value.length < 9) {
                                          return "Longitud invalida";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      // keyboardType:  TextInputType.emailAddress,
                                      controller: loginController.constrasenaController,
                                      obscureText: valida,
                                      decoration: InputDecoration(
                                          labelText: "Contraseña",
                                          border: OutlineInputBorder(),
                                          prefix: Icon(Icons.lock),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                valida = !valida;
                                              });
                                            },
                                            child: Icon(valida
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                          )),
                                      validator: (value) {
                                        // if(value != loginController.constrasenaController || value != loginController.documentoController){
                                        //   return "Credenciales incorrectas";
                                        // }
                                        if (value!.isEmpty) {
                                          return "Ingrese su Constraseña";
                                        } if (value.length < 9) {
                                          return "Longitud invalida";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          print("Sirve");
                                          _Documento.clear();
                                          _Contrasena.clear();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BarraInferior()));
                                          loginController.loginUser();
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 24, 199, 39),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: Text("Ingresar",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                      fontFamily:'linda' ))),
                                      ),
                                    ),
                                  ])),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movil_senastion/components/token.dart';
import 'package:movil_senastion/models/modelUsuario.dart';
import 'package:http/http.dart' as http;
import 'package:movil_senastion/view/login/controller.dart';
import 'dart:convert';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:movil_senastion/view/login/controller.dart';
import 'package:dio/dio.dart';

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  State<Usuarios> createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  List<Usuario> usuarios = [];
  // List<Token> tokens = [];

  // List<Token> autenticacion= [];

  @override
  void initState() {
    super.initState();
    // miFuncionAsync();
    getUsuarios();
  }

  Future<void> getUsuarios() async {
    try {
      final response = await Dio()
          .get("https://apidesplegar-production.up.railway.app/api/usuarios");

      // final responseC = await Dio().post('https://dc5b-191-156-42-194.ngrok.io/acceso/auth');

      if (response.statusCode == 200) {
        final List<dynamic> usuariosData = response.data;

        // final List<dynamic> tokenData = responseToken.bodyBytes;
        // final List<dynamic> authData = responseC.data;
        setState(() {
          // autenticacion = authData.map((e) => Token.fromJson(e)).toList();
          usuarios =
              usuariosData.map((data) => Usuario.fromJson(data)).toList();
          print("Usuarios: $usuarios");
        });
      } else {
        throw Exception("Error, no se pudieron cargar los datos.");
      }
    } catch (e) {
      print("Error al obtener datos: $e");
    }
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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              if (usuarios.isNotEmpty) {
                // final usuario = usuarios[index];
                Map<String, dynamic>? userInfo = AuthState().decodedToken;
                // final token = tokens[index];
                if (userInfo != null) {
                  String documento = userInfo['documento'] ?? '';
                  String nombre = userInfo['nombre'] ?? '';
                  String apellidos = userInfo['apellidos'] ?? '';
                  String email = userInfo['email'] ?? '';
                  String telefono = userInfo['telefono'] ?? '';

                  // if (documento == usuario.documento) {
                  return InkWell(
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => DetallePerfil(heroTag: index),
                    //   ));
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
                                        color:
                                            Color.fromARGB(255, 235, 235, 235),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: SizedBox(
                                          width: 350,
                                          height: 320,
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
                                                  CircleAvatar(
                                                    child: Text(
                                                      nombre.substring(0, 1),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Nombre: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      "${nombre} ${apellidos}"),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    "Documento: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(documento),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    "Correo Electronico",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(email),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    "Número Telefonico",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(telefono),
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
                    ),
                  );
                  // } else {
                  //   print("No son iguales");
                  // }
                } else {
                  print("En perfil el token no se descodificó bien");
                }
              }
            },
          ),
        ),
      ),
    );
  }

  // final secureStorage = new FlutterSecureStorage();

// class AuthLogin {
  // final secureStorage = new FlutterSecureStorage();
  Future<void> Login() async {
    TextEditingController documentoController = TextEditingController();
    TextEditingController constrasenaController = TextEditingController();

    try {
      const url =
          'https://apidesplegar-production.up.railway.app/api/acceso/auth';
      var responseToken = await http.post(
        Uri.parse(url),
        body: {
          "documento": documentoController.text,
          "password": constrasenaController.text,
        },
      );

      print("Estado de la petición:${responseToken.statusCode}");
      // final responseC = await Dio().post('https://dc5b-191-156-42-194.ngrok.io/acceso/auth');

      if (responseToken.statusCode == 201) {
        final restoken = responseToken.body;
        final Map<String, dynamic> tokenMap = json.decode(restoken);
        Token token = Token.fromJson(
            tokenMap); //Teh argument type 'String' can´t assigned to the parameter type 'Map<String, dynamic>'
        print('Respuesta del token: $token');

        List<QuejasUsuario> quejas = token.userSave.userInfo.quejasUsuarios;
        print('Quejas Usuarios: $quejas');

        // Map<String, dynamic> decodedToken = JwtDecoder.decode(restoken);
        // Token token = Token.fromJson(decodedToken);
        // UserInfo userInfo = token.userInfo;

        // final List<dynamic> tokenData = responseToken.bodyBytes;
        // final List<dynamic> authData = responseC.data;
        // setState(() {
        // autenticacion = authData.map((e) => Token.fromJson(e)).toList();

        // Token tokens = Token.fromJson(decodedToken['userInfo']);
        // print("Tokens: $tokens");
        // });
      } else {
        throw Exception("Error, no se pudieron cargar los datos.");
      }
    } catch (e) {
      print("Error al obtener datos: $e");
    }
  }
}
// // Future<void> miFuncionAsync() async {
// //   final tokenService = TokenService();
// //   try {
// //     final decodedToken = await tokenService.getDecodedToken();

// //     if (decodedToken != null) {
// //       final username = decodedToken['userSave']['userInfo'];
// //       // Ahora 'username' contiene el valor del campo 'userSave' en el token JWT.
// //       print('Nombre de usuario: $username');
// //     } else {
// //       // Maneja el caso en el que el token no se pudo decodificar o no existe.
// //       print('No se pudo obtener o decodificar el token.');
// //     }
// //   } catch (e) {
// //     // Maneja cualquier error que pueda ocurrir al obtener o decodificar el token.
// //     print('Error: $e');
// //   }
// // }


//   void getQuejas() async {
//     final response = await get(url);
//     if (response.statusCode == 200) {
//       String body = utf8.decode(response.bodyBytes);
//       final data = jsonDecode(body);
//       for (var i in data[0]) {
//           setState(() {
//             quejaList.add(Queja(i['descripcionMotivo']));
//           });
//       }
//     }
//   }
// }

// void getQuejas() async {
//   final response = await get(url);
//   if (response.statusCode == 200) {
//     String body = utf8.decode(response.bodyBytes);
//     final List<dynamic> jsonDataList = jsonDecode(body);

//     setState(() {
//       Map quejaList = jsonDataList.map((jsonData) {
//         return Queja.fromJson(jsonData);
//       }).toList();
//     });
//     print('Quejas Cargadas:');
//     print(quejaList.length);
//   } else {
//     print('Error al obtener las quejas. Codigo de estado: ${response.statusCode}');
//   }
// }
// }


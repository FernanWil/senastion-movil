import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movil_senastion/components/token.dart';
import 'dart:convert';

class AuthLogin {
  final secureStorage = new FlutterSecureStorage();
  TextEditingController documentoController = TextEditingController();
  TextEditingController constrasenaController = TextEditingController();
  List<Token> tokens = [];

  Future loginUser() async {
    const url =
        'https://apidesplegar-production.up.railway.app/api/acceso/auth';

    var response = await http.post(
      Uri.parse(url),
      body: {
        "documento": documentoController.text,
        "password": constrasenaController.text,
      },
    );
    print("12947303752");
    print(response.statusCode);

    if (response.statusCode == 201) {
    // print("Token nitido: ${token}");
    // final restoken = response.body;
    // print('Respuesta del token: $restoken');
    // final Map<String, dynamic> tokenMap = json.decode(restoken);
    // Token token = Token.fromJson(
    //     tokenMap); //Teh argument type 'String' can´t assigned to the parameter type 'Map<String, dynamic>'

    // List<QuejasUsuario> quejas = token.userSave.userInfo.quejasUsuarios;
    // token = tokenMap.map((data) => Token.fromJson(data)).toList();
    // print('Quejas Usuarios: $quejas');
    // autenticacion = authData.map((e) => Token.fromJson(e)).toList();

    final token = response.body;
    await secureStorage.write(key: 'token', value: token);

    try {
      print("Melo");
      print("Token normal: $token");
      Map<String, dynamic> decodedToken = json.decode(
        utf8.decode(base64Decode(token.split('.')[1])),
      );

      print("token descodificado $decodedToken");

      // Acceder a la información del usuario si existe
      // if (decodedToken == null && decodedToken.containsKey('userSave')) {
        Map<String, dynamic> userInfo = decodedToken['userInfo'];
      AuthState().setDecodedToken(userInfo);

        // Acceder a campos específicos después de verificar si son nulos

        int idUsuario = userInfo['idUsuario'];
        String documento = userInfo['documento'] ?? '';
        String nombre = userInfo['nombre'] ?? '';
        String apellidos = userInfo['apellidos'] ?? '';
        String email = userInfo['email'] ?? '';
        String telefono = userInfo['telefono'] ?? '';

        // Acceder a información adicional después de verificar si es nula
        Map<String, dynamic> tipoDocumentoUsuario = userInfo['tipoDocumentoUsuario'];
        int idTipoDocumento = tipoDocumentoUsuario['idTipoDocumento'] ?? 0;
        String nombreTipoDocumento =
            tipoDocumentoUsuario['nombreTipoDocumento'] ?? '';



        // Continuar con el resto de los campos y sus verificaciones

        // Imprimir valores después de las comprobaciones
        print("ID de usuario: $idUsuario");
        print("Documento: $documento");
        print("Nombre: $nombre");
        print("Apellidos: $apellidos");
        print("Email: $email");
        print("Teléfono: $telefono");
        print("ID Tipo de Documento: $idTipoDocumento");
        print("Nombre Tipo de Documento: $nombreTipoDocumento");

        // Acceder a información de acceso después de verificar si existe
        // if (userSave.containsKey('userAccess')) {
         
          // Continuar con otros campos de acceso y verificaciones
        // } else {
        //   print("El token no contiene información de acceso.");
        // }
      // } else {
      //   print("El token no contiene información de usuario.");
      // }
    } catch (e) {
      print("El token no es válido $e");
    }
    } else {
      print("Respuesta del servidor: ");
      // print(response.statusCode);
    }

    // Cerrar los controladores de texto después de su uso
    documentoController.dispose();
    constrasenaController.dispose();
  }
}

class AuthState {
  static final AuthState _instance = AuthState._internal();

  factory AuthState() {
    return _instance;
  }

  AuthState._internal();

  Map<String, dynamic>? _decodedToken;

  // Método para obtener la información del token descodificado
  Map<String, dynamic>? get decodedToken => _decodedToken;

  // Método para establecer la información del token descodificado
  void setDecodedToken(Map<String, dynamic> token) {
    _decodedToken = token;
  }
}

// class TokenService {
//   final secureStorage = FlutterSecureStorage();

//   Future<Map<String, dynamic>?> getDecodedToken() async {
//     // Obtén el token almacenado de FlutterSecureStorage
//     final token = await secureStorage.read(key: 'token');

//     if (token != null) {
//       // Si el token no es nulo, decodifica el token JWT para obtener información del payload
//       Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
//       return decodedToken;
//     } else {
//       // Si el token es nulo, devuelve null o algún otro valor predeterminado según sea necesario
//       return null;
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:jwt_decode/jwt_decode.dart';

// class AuthLogin {
//   final secureStorage = new FlutterSecureStorage();
//   TextEditingController documentoController = TextEditingController();
//   TextEditingController constrasenaController = TextEditingController();

//   Future loginUser() async {
//     const url = 'https://apidesplegar-production-bc1c.up.railway.app/api/acceso/auth';

//     try {
//       var response = await http.post(
//         Uri.parse(url),
//         body: {
//           "documento": documentoController.text,
//           "password": constrasenaController.text,
//         },
//       );

//       if (response.statusCode == 201) {
//         final token = response.body;
//         await secureStorage.write(key: 'token', value: token);
//         print("Token guardado: $token");

//         Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
//         print("Token decodificado: $decodedToken");
//       } else {
//         print("Respuesta del servidor: ${response.body}");
//         print(response.statusCode);
//       }
//     } catch (e) {
//       print("Error en la solicitud: $e");
//     }

//     // Cerrar los controladores de texto después de su uso
//     documentoController.dispose();
//     constrasenaController.dispose();
//   }

//   Future<Map<String, dynamic>?> getDecodedToken() async {
//     // Obtén el token almacenado de FlutterSecureStorage
//     final token = await secureStorage.read(key: 'token');

//     if (token != null) {
//       // Si el token no es nulo, decodifica el token JWT para obtener información del payload
//       Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
//       return decodedToken;
//     } else {
//       // Si el token es nulo, devuelve null o algún otro valor predeterminado según sea necesario
//       return null;
//     }
//   }
// }

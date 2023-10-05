// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

class Usuario {
    final int idUsuario;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;
    final TipoDocumentoUsuario tipoDocumentoUsuario;
    final RolUsuario rolUsuario;

    Usuario({
        required this.idUsuario,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
        required this.tipoDocumentoUsuario,
        required this.rolUsuario,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idUsuario"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
        tipoDocumentoUsuario: TipoDocumentoUsuario.fromJson(json["tipoDocumentoUsuario"]),
        rolUsuario: RolUsuario.fromJson(json["rolUsuario"]),
    );

    Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "documento": documento,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "telefono": telefono,
        "tipoDocumentoUsuario": tipoDocumentoUsuario.toJson(),
        "rolUsuario": rolUsuario.toJson(),
    };
}

class RolUsuario {
    final int idRol;
    final String nombreRol;

    RolUsuario({
        required this.idRol,
        required this.nombreRol,
    });

    factory RolUsuario.fromJson(Map<String, dynamic> json) => RolUsuario(
        idRol: json["idRol"],
        nombreRol: json["nombreRol"],
    );

    Map<String, dynamic> toJson() => {
        "idRol": idRol,
        "nombreRol": nombreRol,
    };
}

class TipoDocumentoUsuario {
    final int idTipoDocumento;
    final String nombreTipoDocumento;

    TipoDocumentoUsuario({
        required this.idTipoDocumento,
        required this.nombreTipoDocumento,
    });

    factory TipoDocumentoUsuario.fromJson(Map<String, dynamic> json) => TipoDocumentoUsuario(
        idTipoDocumento: json["idTipoDocumento"],
        nombreTipoDocumento: json["nombreTipoDocumento"],
    );

    Map<String, dynamic> toJson() => {
        "idTipoDocumento": idTipoDocumento,
        "nombreTipoDocumento": nombreTipoDocumento,
    };
}

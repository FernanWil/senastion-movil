// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    final String token;
    final UserSave userSave;

    Token({
        required this.token,
        required this.userSave,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        userSave: UserSave.fromJson(json["userSave"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "userSave": userSave.toJson(),
    };
}

class UserSave {
    final UserInfo userInfo;
    final UserAccess userAccess;

    UserSave({
        required this.userInfo,
        required this.userAccess,
    });

    factory UserSave.fromJson(Map<String, dynamic> json) => UserSave(
        userInfo: UserInfo.fromJson(json["userInfo"]),
        userAccess: UserAccess.fromJson(json["userAccess"]),
    );

    Map<String, dynamic> toJson() => {
        "userInfo": userInfo.toJson(),
        "userAccess": userAccess.toJson(),
    };
}

class UserAccess {
    final int idAcceso;
    final String documento;
    final int idUsuarioAprendiz;

    UserAccess({
        required this.idAcceso,
        required this.documento,
        required this.idUsuarioAprendiz,
    });

    factory UserAccess.fromJson(Map<String, dynamic> json) => UserAccess(
        idAcceso: json["idAcceso"],
        documento: json["documento"],
        idUsuarioAprendiz: json["idUsuarioAprendiz"],
    );

    Map<String, dynamic> toJson() => {
        "idAcceso": idAcceso,
        "documento": documento,
        "idUsuarioAprendiz": idUsuarioAprendiz,
    };
}

class UserInfo {
    final int idUsuario;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;
    final TipoDocumentoUsuario tipoDocumentoUsuario;
    final RolUsuario rolUsuario;
    final List<QuejasUsuario> quejasUsuarios;

    UserInfo({
        required this.idUsuario,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
        required this.tipoDocumentoUsuario,
        required this.rolUsuario,
        required this.quejasUsuarios,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        idUsuario: json["idUsuario"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
        tipoDocumentoUsuario: TipoDocumentoUsuario.fromJson(json["tipoDocumentoUsuario"]),
        rolUsuario: RolUsuario.fromJson(json["rolUsuario"]),
        quejasUsuarios: List<QuejasUsuario>.from(json["quejasUsuarios"].map((x) => QuejasUsuario.fromJson(x))),
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
        "quejasUsuarios": List<dynamic>.from(quejasUsuarios.map((x) => x.toJson())),
    };
}

class QuejasUsuario {
    final int idQueja;
    final dynamic archivoQueja;
    final int trimestre;
    final String descripcionMotivo;
    final dynamic otraDecision;
    final bool asisteComite;
    final dynamic otrosInstructores;
    final ComiteQueja? comiteQueja;
    final AprendizQueja aprendizQueja;
    final MotivoQueja motivoQueja;
    final ResultadoAQueja resultadoAQueja;

    QuejasUsuario({
        required this.idQueja,
        required this.archivoQueja,
        required this.trimestre,
        required this.descripcionMotivo,
        required this.otraDecision,
        required this.asisteComite,
        required this.otrosInstructores,
        required this.comiteQueja,
        required this.aprendizQueja,
        required this.motivoQueja,
        required this.resultadoAQueja,
    });

    factory QuejasUsuario.fromJson(Map<String, dynamic> json) => QuejasUsuario(
        idQueja: json["idQueja"],
        archivoQueja: json["archivoQueja"],
        trimestre: json["trimestre"],
        descripcionMotivo: json["descripcionMotivo"],
        otraDecision: json["otraDecision"],
        asisteComite: json["asisteComite"],
        otrosInstructores: json["otrosInstructores"],
        comiteQueja: json["comiteQueja"] == null ? null : ComiteQueja.fromJson(json["comiteQueja"]),
        aprendizQueja: AprendizQueja.fromJson(json["aprendizQueja"]),
        motivoQueja: MotivoQueja.fromJson(json["motivoQueja"]),
        resultadoAQueja: ResultadoAQueja.fromJson(json["resultadoAQueja"]),
    );

    Map<String, dynamic> toJson() => {
        "idQueja": idQueja,
        "archivoQueja": archivoQueja,
        "trimestre": trimestre,
        "descripcionMotivo": descripcionMotivo,
        "otraDecision": otraDecision,
        "asisteComite": asisteComite,
        "otrosInstructores": otrosInstructores,
        "comiteQueja": comiteQueja?.toJson(),
        "aprendizQueja": aprendizQueja.toJson(),
        "motivoQueja": motivoQueja.toJson(),
        "resultadoAQueja": resultadoAQueja.toJson(),
    };
}

class AprendizQueja {
    final int idAprendiz;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;
    final int estadoAprendiz;

    AprendizQueja({
        required this.idAprendiz,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
        required this.estadoAprendiz,
    });

    factory AprendizQueja.fromJson(Map<String, dynamic> json) => AprendizQueja(
        idAprendiz: json["idAprendiz"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
        estadoAprendiz: json["estadoAprendiz"],
    );

    Map<String, dynamic> toJson() => {
        "idAprendiz": idAprendiz,
        "documento": documento,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "telefono": telefono,
        "estadoAprendiz": estadoAprendiz,
    };
}

class ComiteQueja {
    final int idComite;
    final DateTime fechaHoraInicio;
    final DateTime fechaHoraFin;
    final String codigoComite;
    final int estadoComite;
    final String link;
    final String acta;
    final String resolucion;

    ComiteQueja({
        required this.idComite,
        required this.fechaHoraInicio,
        required this.fechaHoraFin,
        required this.codigoComite,
        required this.estadoComite,
        required this.link,
        required this.acta,
        required this.resolucion,
    });

    factory ComiteQueja.fromJson(Map<String, dynamic> json) => ComiteQueja(
        idComite: json["idComite"],
        fechaHoraInicio: DateTime.parse(json["fechaHoraInicio"]),
        fechaHoraFin: DateTime.parse(json["fechaHoraFin"]),
        codigoComite: json["codigoComite"],
        estadoComite: json["estadoComite"],
        link: json["link"],
        acta: json["acta"],
        resolucion: json["resolucion"],
    );

    Map<String, dynamic> toJson() => {
        "idComite": idComite,
        "fechaHoraInicio": fechaHoraInicio.toIso8601String(),
        "fechaHoraFin": fechaHoraFin.toIso8601String(),
        "codigoComite": codigoComite,
        "estadoComite": estadoComite,
        "link": link,
        "acta": acta,
        "resolucion": resolucion,
    };
}

class MotivoQueja {
    final int idMotivoComite;
    final String nombreMotivo;

    MotivoQueja({
        required this.idMotivoComite,
        required this.nombreMotivo,
    });

    factory MotivoQueja.fromJson(Map<String, dynamic> json) => MotivoQueja(
        idMotivoComite: json["idMotivoComite"],
        nombreMotivo: json["nombreMotivo"],
    );

    Map<String, dynamic> toJson() => {
        "idMotivoComite": idMotivoComite,
        "nombreMotivo": nombreMotivo,
    };
}

class ResultadoAQueja {
    final int idResultadoAprendizaje;
    final String nombreRa;
    final String codigoRa;

    ResultadoAQueja({
        required this.idResultadoAprendizaje,
        required this.nombreRa,
        required this.codigoRa,
    });

    factory ResultadoAQueja.fromJson(Map<String, dynamic> json) => ResultadoAQueja(
        idResultadoAprendizaje: json["idResultadoAprendizaje"],
        nombreRa: json["nombreRA"],
        codigoRa: json["codigoRA"],
    );

    Map<String, dynamic> toJson() => {
        "idResultadoAprendizaje": idResultadoAprendizaje,
        "nombreRA": nombreRa,
        "codigoRA": codigoRa,
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

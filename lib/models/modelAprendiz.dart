// To parse this JSON data, do
//
//     final aprendiz = aprendizFromJson(jsonString);

import 'dart:convert';

List<Aprendiz> aprendizFromJson(String str) => List<Aprendiz>.from(json.decode(str).map((x) => Aprendiz.fromJson(x)));

String aprendizToJson(List<Aprendiz> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aprendiz {
    final int idAprendiz;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;
    final int estadoAprendiz;
    final TipoDocumentoAprendiz tipoDocumentoAprendiz;
    final RolAprendiz rolAprendiz;
    final FichaAprendiz fichaAprendiz;
    final dynamic grupoAprendiz;

    Aprendiz({
        required this.idAprendiz,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
        required this.estadoAprendiz,
        required this.tipoDocumentoAprendiz,
        required this.rolAprendiz,
        required this.fichaAprendiz,
        required this.grupoAprendiz,
    });

    factory Aprendiz.fromJson(Map<String, dynamic> json) => Aprendiz(
        idAprendiz: json["idAprendiz"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
        estadoAprendiz: json["estadoAprendiz"],
        tipoDocumentoAprendiz: TipoDocumentoAprendiz.fromJson(json["tipoDocumentoAprendiz"]),
        rolAprendiz: RolAprendiz.fromJson(json["rolAprendiz"]),
        fichaAprendiz: FichaAprendiz.fromJson(json["fichaAprendiz"]),
        grupoAprendiz: json["grupoAprendiz"],
    );

    Map<String, dynamic> toJson() => {
        "idAprendiz": idAprendiz,
        "documento": documento,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "telefono": telefono,
        "estadoAprendiz": estadoAprendiz,
        "tipoDocumentoAprendiz": tipoDocumentoAprendiz.toJson(),
        "rolAprendiz": rolAprendiz.toJson(),
        "fichaAprendiz": fichaAprendiz.toJson(),
        "grupoAprendiz": grupoAprendiz,
    };
}

class FichaAprendiz {
    final int idFicha;
    final String codigoFicha;
    final dynamic voceroFicha;
    final UsuarioFichaDirector usuarioFichaDirector;
    final ProgramaFicha programaFicha;

    FichaAprendiz({
        required this.idFicha,
        required this.codigoFicha,
        required this.voceroFicha,
        required this.usuarioFichaDirector,
        required this.programaFicha,
    });

    factory FichaAprendiz.fromJson(Map<String, dynamic> json) => FichaAprendiz(
        idFicha: json["idFicha"],
        codigoFicha: json["codigoFicha"],
        voceroFicha: json["voceroFicha"],
        usuarioFichaDirector: UsuarioFichaDirector.fromJson(json["usuarioFichaDirector"]),
        programaFicha: ProgramaFicha.fromJson(json["programaFicha"]),
    );

    Map<String, dynamic> toJson() => {
        "idFicha": idFicha,
        "codigoFicha": codigoFicha,
        "voceroFicha": voceroFicha,
        "usuarioFichaDirector": usuarioFichaDirector.toJson(),
        "programaFicha": programaFicha.toJson(),
    };
}

class ProgramaFicha {
    final int idProgramaFormativo;
    final String nombrePf;
    final String abreviaturaPf;
    final String codigoPf;
    final int trimestres;

    ProgramaFicha({
        required this.idProgramaFormativo,
        required this.nombrePf,
        required this.abreviaturaPf,
        required this.codigoPf,
        required this.trimestres,
    });

    factory ProgramaFicha.fromJson(Map<String, dynamic> json) => ProgramaFicha(
        idProgramaFormativo: json["idProgramaFormativo"],
        nombrePf: json["nombrePF"],
        abreviaturaPf: json["abreviaturaPF"],
        codigoPf: json["codigoPF"],
        trimestres: json["trimestres"],
    );

    Map<String, dynamic> toJson() => {
        "idProgramaFormativo": idProgramaFormativo,
        "nombrePF": nombrePf,
        "abreviaturaPF": abreviaturaPf,
        "codigoPF": codigoPf,
        "trimestres": trimestres,
    };
}

class UsuarioFichaDirector {
    final int idUsuario;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;

    UsuarioFichaDirector({
        required this.idUsuario,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
    });

    factory UsuarioFichaDirector.fromJson(Map<String, dynamic> json) => UsuarioFichaDirector(
        idUsuario: json["idUsuario"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "documento": documento,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "telefono": telefono,
    };
}

class RolAprendiz {
    final int idRol;
    final String nombreRol;

    RolAprendiz({
        required this.idRol,
        required this.nombreRol,
    });

    factory RolAprendiz.fromJson(Map<String, dynamic> json) => RolAprendiz(
        idRol: json["idRol"],
        nombreRol: json["nombreRol"],
    );

    Map<String, dynamic> toJson() => {
        "idRol": idRol,
        "nombreRol": nombreRol,
    };
}

class TipoDocumentoAprendiz {
    final int idTipoDocumento;
    final String nombreTipoDocumento;

    TipoDocumentoAprendiz({
        required this.idTipoDocumento,
        required this.nombreTipoDocumento,
    });

    factory TipoDocumentoAprendiz.fromJson(Map<String, dynamic> json) => TipoDocumentoAprendiz(
        idTipoDocumento: json["idTipoDocumento"],
        nombreTipoDocumento: json["nombreTipoDocumento"],
    );

    Map<String, dynamic> toJson() => {
        "idTipoDocumento": idTipoDocumento,
        "nombreTipoDocumento": nombreTipoDocumento,
    };
}

// // To parse this JSON data, do
// //
// //     final comites = comitesFromJson(jsonString);

// import 'dart:convert';

// List<Comites> comitesFromJson(String str) => List<Comites>.from(json.decode(str).map((x) => Comites.fromJson(x)));

// String comitesToJson(List<Comites> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Comites {
//     final int idComite;
//     final DateTime fechaHoraInicio;
//     final DateTime fechaHoraFin;
//     final String codigoComite;
//     final int estadoComite;
//     final String link;
//     final String acta;
//     final String? resolucion;
//     final PcaComite pcaComite;

//     Comites({
//         required this.idComite,
//         required this.fechaHoraInicio,
//         required this.fechaHoraFin,
//         required this.codigoComite,
//         required this.estadoComite,
//         required this.link,
//         required this.acta,
//         required this.resolucion,
//         required this.pcaComite,
//     });

//     factory Comites.fromJson(Map<String, dynamic> json) => Comites(
//         idComite: json["idComite"],
//         fechaHoraInicio: DateTime.parse(json["fechaHoraInicio"]),
//         fechaHoraFin: DateTime.parse(json["fechaHoraFin"]),
//         codigoComite: json["codigoComite"],
//         estadoComite: json["estadoComite"],
//         link: json["link"],
//         acta: json["acta"],
//         resolucion: json["resolucion"],
//         pcaComite: PcaComite.fromJson(json["pcaComite"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "idComite": idComite,
//         "fechaHoraInicio": fechaHoraInicio.toIso8601String(),
//         "fechaHoraFin": fechaHoraFin.toIso8601String(),
//         "codigoComite": codigoComite,
//         "estadoComite": estadoComite,
//         "link": link,
//         "acta": acta,
//         "resolucion": resolucion,
//         "pcaComite": pcaComite.toJson(),
//     };
// }

// class PcaComite {
//     final int idPca;
//     final ProgramaFormativo programaFormativo;
//     final Usuario usuario;

//     PcaComite({
//         required this.idPca,
//         required this.programaFormativo,
//         required this.usuario,
//     });

//     factory PcaComite.fromJson(Map<String, dynamic> json) => PcaComite(
//         idPca: json["idPCA"],
//         programaFormativo: ProgramaFormativo.fromJson(json["programaFormativo"]),
//         usuario: Usuario.fromJson(json["usuario"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "idPCA": idPca,
//         "programaFormativo": programaFormativo.toJson(),
//         "usuario": usuario.toJson(),
//     };
// }

// class ProgramaFormativo {
//     final int idProgramaFormativo;
//     final String nombrePf;
//     final String abreviaturaPf;
//     final String codigoPf;
//     final int trimestres;

//     ProgramaFormativo({
//         required this.idProgramaFormativo,
//         required this.nombrePf,
//         required this.abreviaturaPf,
//         required this.codigoPf,
//         required this.trimestres,
//     });

//     factory ProgramaFormativo.fromJson(Map<String, dynamic> json) => ProgramaFormativo(
//         idProgramaFormativo: json["idProgramaFormativo"],
//         nombrePf: json["nombrePF"],
//         abreviaturaPf: json["abreviaturaPF"],
//         codigoPf: json["codigoPF"],
//         trimestres: json["trimestres"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idProgramaFormativo": idProgramaFormativo,
//         "nombrePF": nombrePf,
//         "abreviaturaPF": abreviaturaPf,
//         "codigoPF": codigoPf,
//         "trimestres": trimestres,
//     };
// }

// class Usuario {
//     final int idUsuario;
//     final String documento;
//     final String nombre;
//     final String apellidos;
//     final String email;
//     final String telefono;

//     Usuario({
//         required this.idUsuario,
//         required this.documento,
//         required this.nombre,
//         required this.apellidos,
//         required this.email,
//         required this.telefono,
//     });

//     factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
//         idUsuario: json["idUsuario"],
//         documento: json["documento"],
//         nombre: json["nombre"],
//         apellidos: json["apellidos"],
//         email: json["email"],
//         telefono: json["telefono"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idUsuario": idUsuario,
//         "documento": documento,
//         "nombre": nombre,
//         "apellidos": apellidos,
//         "email": email,
//         "telefono": telefono,
//     };
// }


// To parse this JSON data, do
//
//     final comite = comiteFromJson(jsonString);

import 'dart:convert';

List<Comite> comiteFromJson(String str) => List<Comite>.from(json.decode(str).map((x) => Comite.fromJson(x)));

String comiteToJson(List<Comite> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comite {
    final int idComite;
    final DateTime fechaHoraInicio;
    final DateTime fechaHoraFin;
    final String codigoComite;
    final int estadoComite;
    final String link;
    final String acta;
    final String resolucion;
    final PcaComite pcaComite;

    Comite({
        required this.idComite,
        required this.fechaHoraInicio,
        required this.fechaHoraFin,
        required this.codigoComite,
        required this.estadoComite,
        required this.link,
        required this.acta,
        required this.resolucion,
        required this.pcaComite,
    });

    factory Comite.fromJson(Map<String, dynamic> json) => Comite(
        idComite: json["idComite"],
        fechaHoraInicio: DateTime.parse(json["fechaHoraInicio"]),
        fechaHoraFin: DateTime.parse(json["fechaHoraFin"]),
        codigoComite: json["codigoComite"],
        estadoComite: json["estadoComite"],
        link: json["link"],
        acta: json["acta"],
        resolucion: json["resolucion"],
        pcaComite: PcaComite.fromJson(json["pcaComite"]),
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
        "pcaComite": pcaComite.toJson(),
    };
}

class PcaComite {
    final int idPca;
    final ProgramaFormativo programaFormativo;
    final Usuario usuario;

    PcaComite({
        required this.idPca,
        required this.programaFormativo,
        required this.usuario,
    });

    factory PcaComite.fromJson(Map<String, dynamic> json) => PcaComite(
        idPca: json["idPCA"],
        programaFormativo: ProgramaFormativo.fromJson(json["programaFormativo"]),
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "idPCA": idPca,
        "programaFormativo": programaFormativo.toJson(),
        "usuario": usuario.toJson(),
    };
}

class ProgramaFormativo {
    final int idProgramaFormativo;
    final String nombrePf;
    final String abreviaturaPf;
    final String codigoPf;
    final int trimestres;

    ProgramaFormativo({
        required this.idProgramaFormativo,
        required this.nombrePf,
        required this.abreviaturaPf,
        required this.codigoPf,
        required this.trimestres,
    });

    factory ProgramaFormativo.fromJson(Map<String, dynamic> json) => ProgramaFormativo(
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

class Usuario {
    final int idUsuario;
    final String documento;
    final String nombre;
    final String apellidos;
    final String email;
    final String telefono;

    Usuario({
        required this.idUsuario,
        required this.documento,
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.telefono,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
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

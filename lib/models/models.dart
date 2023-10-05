// // To parse this JSON data, do
// //
// //     final queja = quejaFromJson(jsonString);

// import 'dart:convert';

// List<Queja> quejaFromJson(String str) => List<Queja>.from(json.decode(str).map((x) => Queja.fromJson(x)));

// String quejaToJson(List<Queja> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Queja {
//     final int idQueja;
//     // final dynamic archivoQueja;
//     final int trimestre;
//     final String descripcionMotivo;
//     // final dynamic otraDecision;
//     final bool asisteComite;
//     // final dynamic otrosInstructores;
//     final AprendizQueja aprendizQueja;
//     final UsuarioQueja usuarioQueja;
//     final MotivoQueja motivoQueja;
//     final EstadoQueja estadoQueja;
//     final ComiteQueja comiteQueja;
//     final DecisionQueja decisionQueja;
//     final CompetenciaQueja competenciaQueja;
//     // final ResultadoAQueja resultadoAQueja;

//     Queja({
//         required this.idQueja,
//         // this.archivoQueja = 'Ninguno',
//         required this.trimestre,
//         required this.descripcionMotivo,
//         // this.otraDecision = 'Ninguno',
//         required this.asisteComite,
//         // this.otrosInstructores = 'Ninguno',
//         required this.aprendizQueja,
//         required this.usuarioQueja,
//         required this.motivoQueja,
//         required this.estadoQueja,
//         required this.comiteQueja,
//         required this.decisionQueja,
//         required this.competenciaQueja,
//         // required this.resultadoAQueja,
//     });

//     factory Queja.fromJson(Map<String, dynamic> json) => Queja(
//         idQueja: json["idQueja"],
//         // archivoQueja: json["archivoQueja"] ?? "",
//         trimestre: json["trimestre"],
//         descripcionMotivo: json["descripcionMotivo"],
//         // otraDecision: json["otraDecision"] ?? "",
//         asisteComite: json["asisteComite"],
//         // otrosInstructores: json["otrosInstructores"] ?? "",
//         aprendizQueja: AprendizQueja.fromJson(json["aprendizQueja"]),
//         usuarioQueja: UsuarioQueja.fromJson(json["usuarioQueja"]),
//         motivoQueja: MotivoQueja.fromJson(json["motivoQueja"]),
//         estadoQueja: EstadoQueja.fromJson(json["estadoQueja"]),
//         comiteQueja: ComiteQueja.fromJson(json["comiteQueja"]),
//         decisionQueja: DecisionQueja.fromJson(json["decisionQueja"]),
//         competenciaQueja: CompetenciaQueja.fromJson(json["competenciaQueja"]),
//         // resultadoAQueja: ResultadoAQueja.fromJson(json["resultadoAQueja"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "idQueja": idQueja,
//         // "archivoQueja": archivoQueja,
//         "trimestre": trimestre,
//         "descripcionMotivo": descripcionMotivo,
//         // "otraDecision": otraDecision,
//         "asisteComite": asisteComite,
//         // "otrosInstructores": otrosInstructores,
//         "aprendizQueja": aprendizQueja.toJson(),
//         "usuarioQueja": usuarioQueja.toJson(),
//         "motivoQueja": motivoQueja.toJson(),
//         "estadoQueja": estadoQueja.toJson(),
//         "comiteQueja": comiteQueja.toJson(),
//         "decisionQueja": decisionQueja.toJson(),
//         "competenciaQueja": competenciaQueja.toJson(),
//         // "resultadoAQueja": resultadoAQueja.toJson(),
//     };
// }

// class AprendizQueja {
//     final int idAprendiz;
//     final String documento;
//     final String nombre;
//     final String apellidos;
//     final String email;
//     final String telefono;
//     final int estadoAprendiz;
//     final FichaAprendiz fichaAprendiz;

//     AprendizQueja({
//         required this.idAprendiz,
//         required this.documento,
//         required this.nombre,
//         required this.apellidos,
//         required this.email,
//         required this.telefono,
//         required this.estadoAprendiz,
//         required this.fichaAprendiz,
//     });

//     factory AprendizQueja.fromJson(Map<String, dynamic> json) => AprendizQueja(
//         idAprendiz: json["idAprendiz"],
//         documento: json["documento"],
//         nombre: json["nombre"],
//         apellidos: json["apellidos"],
//         email: json["email"],
//         telefono: json["telefono"],
//         estadoAprendiz: json["estadoAprendiz"],
//         fichaAprendiz: FichaAprendiz.fromJson(json["fichaAprendiz"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "idAprendiz": idAprendiz,
//         "documento": documento,
//         "nombre": nombre,
//         "apellidos": apellidos,
//         "email": email,
//         "telefono": telefono,
//         "estadoAprendiz": estadoAprendiz,
//         "fichaAprendiz": fichaAprendiz.toJson(),
//     };
// }

// class FichaAprendiz {
//     final int idFicha;
//     final String codigoFicha;
//     // final dynamic voceroFicha;

//     FichaAprendiz({
//         required this.idFicha,
//         required this.codigoFicha,
//         // this.voceroFicha = 'Ninguno',
//     });

//     factory FichaAprendiz.fromJson(Map<String, dynamic> json) => FichaAprendiz(
//         idFicha: json["idFicha"],
//         codigoFicha: json["codigoFicha"],
//         // voceroFicha: json["voceroFicha"] ?? "",
//     );

//     Map<String, dynamic> toJson() => {
//         "idFicha": idFicha,
//         "codigoFicha": codigoFicha,
//         // "voceroFicha": voceroFicha,
//     };
// }

// class ComiteQueja {
//     final int idComite;
//     final DateTime fechaHoraInicio;
//     final DateTime fechaHoraFin;
//     final String codigoComite;
//     final int estadoComite;
//     final String link;
//     final String acta;
//     final String resolucion;

//     ComiteQueja({
//         required this.idComite,
//         required this.fechaHoraInicio,
//         required this.fechaHoraFin,
//         required this.codigoComite,
//         required this.estadoComite,
//         required this.link,
//         required this.acta,
//         required this.resolucion,
//     });

//     factory ComiteQueja.fromJson(Map<String, dynamic> json) => ComiteQueja(
//         idComite: json["idComite"],
//         fechaHoraInicio: DateTime.parse(json["fechaHoraInicio"]),
//         fechaHoraFin: DateTime.parse(json["fechaHoraFin"]),
//         codigoComite: json["codigoComite"],
//         estadoComite: json["estadoComite"],
//         link: json["link"],
//         acta: json["acta"],
//         resolucion: json["resolucion"],
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
//     };
// }

// class CompetenciaQueja {
//     final int idCompetencia;
//     final String nombreCompetencia;
//     final String nombreNscl;
//     final String codigoCompetencia;
//     final ProgramasCompetencia programasCompetencia;

//     CompetenciaQueja({
//         required this.idCompetencia,
//         required this.nombreCompetencia,
//         required this.nombreNscl,
//         required this.codigoCompetencia,
//         required this.programasCompetencia,
//     });

//     factory CompetenciaQueja.fromJson(Map<String, dynamic> json) => CompetenciaQueja(
//         idCompetencia: json["idCompetencia"],
//         nombreCompetencia: json["nombreCompetencia"],
//         nombreNscl: json["nombreNSCL"],
//         codigoCompetencia: json["codigoCompetencia"],
//         programasCompetencia: ProgramasCompetencia.fromJson(json["programasCompetencia"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "idCompetencia": idCompetencia,
//         "nombreCompetencia": nombreCompetencia,
//         "nombreNSCL": nombreNscl,
//         "codigoCompetencia": codigoCompetencia,
//         "programasCompetencia": programasCompetencia.toJson(),
//     };
// }

// class ProgramasCompetencia {
//     final int idProgramaFormativo;
//     final String nombrePf;
//     final String abreviaturaPf;
//     final String codigoPf;
//     final int trimestres;

//     ProgramasCompetencia({
//         required this.idProgramaFormativo,
//         required this.nombrePf,
//         required this.abreviaturaPf,
//         required this.codigoPf,
//         required this.trimestres,
//     });

//     factory ProgramasCompetencia.fromJson(Map<String, dynamic> json) => ProgramasCompetencia(
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

// class DecisionQueja {
//     final int idDecision;
//     final String nombreDecision;

//     DecisionQueja({
//         required this.idDecision,
//         required this.nombreDecision,
//     });

//     factory DecisionQueja.fromJson(Map<String, dynamic> json) => DecisionQueja(
//         idDecision: json["idDecision"],
//         nombreDecision: json["nombreDecision"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idDecision": idDecision,
//         "nombreDecision": nombreDecision,
//     };
// }

// class EstadoQueja {
//     final int idEstadoQuejas;
//     final String nombreEstadoQuejas;

//     EstadoQueja({
//         required this.idEstadoQuejas,
//         required this.nombreEstadoQuejas,
//     });

//     factory EstadoQueja.fromJson(Map<String, dynamic> json) => EstadoQueja(
//         idEstadoQuejas: json["idEstadoQuejas"],
//         nombreEstadoQuejas: json["nombreEstadoQuejas"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idEstadoQuejas": idEstadoQuejas,
//         "nombreEstadoQuejas": nombreEstadoQuejas,
//     };
// }

// class MotivoQueja {
//     final int idMotivoComite;
//     final String nombreMotivo;

//     MotivoQueja({
//         required this.idMotivoComite,
//         required this.nombreMotivo,
//     });

//     factory MotivoQueja.fromJson(Map<String, dynamic> json) => MotivoQueja(
//         idMotivoComite: json["idMotivoComite"],
//         nombreMotivo: json["nombreMotivo"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idMotivoComite": idMotivoComite,
//         "nombreMotivo": nombreMotivo,
//     };
// }

// class ResultadoAQueja {
//     final int idResultadoAprendizaje;
//     final String nombreRa;
//     final String codigoRa;
//     // final List<dynamic> observacionResultadoA;

//     ResultadoAQueja({
//         required this.idResultadoAprendizaje,
//         required this.nombreRa,
//         required this.codigoRa,
//         // required this.observacionResultadoA,
//     });

//     factory ResultadoAQueja.fromJson(Map<String, dynamic> json) => ResultadoAQueja(
//         idResultadoAprendizaje: json["idResultadoAprendizaje"],
//         nombreRa: json["nombreRA"],
//         codigoRa: json["codigoRA"],
//         // observacionResultadoA: List<dynamic>.from(json["observacionResultadoA"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "idResultadoAprendizaje": idResultadoAprendizaje,
//         "nombreRA": nombreRa,
//         "codigoRA": codigoRa,
//         // "observacionResultadoA": List<dynamic>.from(observacionResultadoA.map((x) => x)),
//     };
// }

// class UsuarioQueja {
//     final int idUsuario;
//     final String documento;
//     final String nombre;
//     final String apellidos;
//     final String email;
//     final String telefono;

//     UsuarioQueja({
//         required this.idUsuario,
//         required this.documento,
//         required this.nombre,
//         required this.apellidos,
//         required this.email,
//         required this.telefono,
//     });

//     factory UsuarioQueja.fromJson(Map<String, dynamic> json) => UsuarioQueja(
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
//     final queja = quejaFromJson(jsonString);

// To parse this JSON data, do
//
//     final queja = quejaFromJson(jsonString);

// To parse this JSON data, do
//
//     final queja = quejaFromJson(jsonString);

import 'dart:convert';

List<Queja> quejaFromJson(String str) => List<Queja>.from(json.decode(str).map((x) => Queja.fromJson(x)));

String quejaToJson(List<Queja> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Queja {
    final int? idQueja;
    final dynamic archivoQueja;
    final int? trimestre;
    final String? descripcionMotivo;
    final dynamic otraDecision;
    final bool? asisteComite;
    final dynamic otrosInstructores;
    final AprendizQueja? aprendizQueja;
    final UsuarioQueja? usuarioQueja;
    final MotivoQueja? motivoQueja;
    final EstadoQueja? estadoQueja;
    final ComiteQueja? comiteQueja;
    final DecisionQueja? decisionQueja;
    final CompetenciaQueja? competenciaQueja;
    final ResultadoAQueja? resultadoAQueja;

    Queja({
        this.idQueja,
        this.archivoQueja,
        this.trimestre,
        this.descripcionMotivo,
        this.otraDecision,
        this.asisteComite,
        this.otrosInstructores,
        this.aprendizQueja,
        this.usuarioQueja,
        this.motivoQueja,
        this.estadoQueja,
        this.comiteQueja,
        this.decisionQueja,
        this.competenciaQueja,
        this.resultadoAQueja,
    });

    factory Queja.fromJson(Map<String, dynamic> json) => Queja(
        idQueja: json["idQueja"],
        archivoQueja: json["archivoQueja"],
        trimestre: json["trimestre"],
        descripcionMotivo: json["descripcionMotivo"],
        otraDecision: json["otraDecision"],
        asisteComite: json["asisteComite"],
        otrosInstructores: json["otrosInstructores"],
        aprendizQueja: json["aprendizQueja"] == null ? null : AprendizQueja.fromJson(json["aprendizQueja"]),
        usuarioQueja: json["usuarioQueja"] == null ? null : UsuarioQueja.fromJson(json["usuarioQueja"]),
        motivoQueja: json["motivoQueja"] == null ? null : MotivoQueja.fromJson(json["motivoQueja"]),
        estadoQueja: json["estadoQueja"] == null ? null : EstadoQueja.fromJson(json["estadoQueja"]),
        comiteQueja: json["comiteQueja"] == null ? null : ComiteQueja.fromJson(json["comiteQueja"]),
        decisionQueja: json["decisionQueja"] == null ? null : DecisionQueja.fromJson(json["decisionQueja"]),
        competenciaQueja: json["competenciaQueja"] == null ? null : CompetenciaQueja.fromJson(json["competenciaQueja"]),
        resultadoAQueja: json["resultadoAQueja"] == null ? null : ResultadoAQueja.fromJson(json["resultadoAQueja"]),
    );

    Map<String, dynamic> toJson() => {
        "idQueja": idQueja,
        "archivoQueja": archivoQueja,
        "trimestre": trimestre,
        "descripcionMotivo": descripcionMotivo,
        "otraDecision": otraDecision,
        "asisteComite": asisteComite,
        "otrosInstructores": otrosInstructores,
        "aprendizQueja": aprendizQueja?.toJson(),
        "usuarioQueja": usuarioQueja?.toJson(),
        "motivoQueja": motivoQueja?.toJson(),
        "estadoQueja": estadoQueja?.toJson(),
        "comiteQueja": comiteQueja?.toJson(),
        "decisionQueja": decisionQueja?.toJson(),
        "competenciaQueja": competenciaQueja?.toJson(),
        "resultadoAQueja": resultadoAQueja?.toJson(),
    };
}

class AprendizQueja {
    final int? idAprendiz;
    final String? documento;
    final String? nombre;
    final String? apellidos;
    final String? email;
    final String? telefono;
    final int? estadoAprendiz;
    final FichaAprendiz? fichaAprendiz;

    AprendizQueja({
        this.idAprendiz,
        this.documento,
        this.nombre,
        this.apellidos,
        this.email,
        this.telefono,
        this.estadoAprendiz,
        this.fichaAprendiz,
    });

    factory AprendizQueja.fromJson(Map<String, dynamic> json) => AprendizQueja(
        idAprendiz: json["idAprendiz"],
        documento: json["documento"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        telefono: json["telefono"],
        estadoAprendiz: json["estadoAprendiz"],
        fichaAprendiz: json["fichaAprendiz"] == null ? null : FichaAprendiz.fromJson(json["fichaAprendiz"]),
    );

    Map<String, dynamic> toJson() => {
        "idAprendiz": idAprendiz,
        "documento": documento,
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "telefono": telefono,
        "estadoAprendiz": estadoAprendiz,
        "fichaAprendiz": fichaAprendiz?.toJson(),
    };
}

class FichaAprendiz {
    final int? idFicha;
    final String? codigoFicha;
    final dynamic voceroFicha;

    FichaAprendiz({
        this.idFicha,
        this.codigoFicha,
        this.voceroFicha,
    });

    factory FichaAprendiz.fromJson(Map<String, dynamic> json) => FichaAprendiz(
        idFicha: json["idFicha"],
        codigoFicha: json["codigoFicha"],
        voceroFicha: json["voceroFicha"],
    );

    Map<String, dynamic> toJson() => {
        "idFicha": idFicha,
        "codigoFicha": codigoFicha,
        "voceroFicha": voceroFicha,
    };
}

class ComiteQueja {
    final int? idComite;
    final DateTime? fechaHoraInicio;
    final DateTime? fechaHoraFin;
    final String? codigoComite;
    final int? estadoComite;
    final String? link;
    final String? acta;
    final String? resolucion;

    ComiteQueja({
        this.idComite,
        this.fechaHoraInicio,
        this.fechaHoraFin,
        this.codigoComite,
        this.estadoComite,
        this.link,
        this.acta,
        this.resolucion,
    });

    factory ComiteQueja.fromJson(Map<String, dynamic> json) => ComiteQueja(
        idComite: json["idComite"],
        fechaHoraInicio: json["fechaHoraInicio"] == null ? null : DateTime.parse(json["fechaHoraInicio"]),
        fechaHoraFin: json["fechaHoraFin"] == null ? null : DateTime.parse(json["fechaHoraFin"]),
        codigoComite: json["codigoComite"],
        estadoComite: json["estadoComite"],
        link: json["link"],
        acta: json["acta"],
        resolucion: json["resolucion"],
    );

    Map<String, dynamic> toJson() => {
        "idComite": idComite,
        "fechaHoraInicio": fechaHoraInicio?.toIso8601String(),
        "fechaHoraFin": fechaHoraFin?.toIso8601String(),
        "codigoComite": codigoComite,
        "estadoComite": estadoComite,
        "link": link,
        "acta": acta,
        "resolucion": resolucion,
    };
}

class CompetenciaQueja {
    final int? idCompetencia;
    final String? nombreCompetencia;
    final String? nombreNscl;
    final String? codigoCompetencia;
    final ProgramasCompetencia? programasCompetencia;

    CompetenciaQueja({
        this.idCompetencia,
        this.nombreCompetencia,
        this.nombreNscl,
        this.codigoCompetencia,
        this.programasCompetencia,
    });

    factory CompetenciaQueja.fromJson(Map<String, dynamic> json) => CompetenciaQueja(
        idCompetencia: json["idCompetencia"],
        nombreCompetencia: json["nombreCompetencia"],
        nombreNscl: json["nombreNSCL"],
        codigoCompetencia: json["codigoCompetencia"],
        programasCompetencia: json["programasCompetencia"] == null ? null : ProgramasCompetencia.fromJson(json["programasCompetencia"]),
    );

    Map<String, dynamic> toJson() => {
        "idCompetencia": idCompetencia,
        "nombreCompetencia": nombreCompetencia,
        "nombreNSCL": nombreNscl,
        "codigoCompetencia": codigoCompetencia,
        "programasCompetencia": programasCompetencia?.toJson(),
    };
}

class ProgramasCompetencia {
    final int? idProgramaFormativo;
    final String? nombrePf;
    final String? abreviaturaPf;
    final String? codigoPf;
    final int? trimestres;

    ProgramasCompetencia({
        this.idProgramaFormativo,
        this.nombrePf,
        this.abreviaturaPf,
        this.codigoPf,
        this.trimestres,
    });

    factory ProgramasCompetencia.fromJson(Map<String, dynamic> json) => ProgramasCompetencia(
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

class DecisionQueja {
    final int? idDecision;
    final String? nombreDecision;

    DecisionQueja({
        this.idDecision,
        this.nombreDecision,
    });

    factory DecisionQueja.fromJson(Map<String, dynamic> json) => DecisionQueja(
        idDecision: json["idDecision"],
        nombreDecision: json["nombreDecision"],
    );

    Map<String, dynamic> toJson() => {
        "idDecision": idDecision,
        "nombreDecision": nombreDecision,
    };
}

class EstadoQueja {
    final int? idEstadoQuejas;
    final String? nombreEstadoQuejas;

    EstadoQueja({
        this.idEstadoQuejas,
        this.nombreEstadoQuejas,
    });

    factory EstadoQueja.fromJson(Map<String, dynamic> json) => EstadoQueja(
        idEstadoQuejas: json["idEstadoQuejas"],
        nombreEstadoQuejas: json["nombreEstadoQuejas"],
    );

    Map<String, dynamic> toJson() => {
        "idEstadoQuejas": idEstadoQuejas,
        "nombreEstadoQuejas": nombreEstadoQuejas,
    };
}

class MotivoQueja {
    final int? idMotivoComite;
    final String? nombreMotivo;

    MotivoQueja({
        this.idMotivoComite,
        this.nombreMotivo,
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
    final int? idResultadoAprendizaje;
    final String? nombreRa;
    final String? codigoRa;
    final List<dynamic>? observacionResultadoA;

    ResultadoAQueja({
        this.idResultadoAprendizaje,
        this.nombreRa,
        this.codigoRa,
        this.observacionResultadoA,
    });

    factory ResultadoAQueja.fromJson(Map<String, dynamic> json) => ResultadoAQueja(
        idResultadoAprendizaje: json["idResultadoAprendizaje"],
        nombreRa: json["nombreRA"],
        codigoRa: json["codigoRA"],
        observacionResultadoA: json["observacionResultadoA"] == null ? [] : List<dynamic>.from(json["observacionResultadoA"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "idResultadoAprendizaje": idResultadoAprendizaje,
        "nombreRA": nombreRa,
        "codigoRA": codigoRa,
        "observacionResultadoA": observacionResultadoA == null ? [] : List<dynamic>.from(observacionResultadoA!.map((x) => x)),
    };
}

class UsuarioQueja {
    final int? idUsuario;
    final String? documento;
    final String? nombre;
    final String? apellidos;
    final String? email;
    final String? telefono;

    UsuarioQueja({
        this.idUsuario,
        this.documento,
        this.nombre,
        this.apellidos,
        this.email,
        this.telefono,
    });

    factory UsuarioQueja.fromJson(Map<String, dynamic> json) => UsuarioQueja(
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

class Laboratorio {
  String id;
  int numero;
  String municipio;
  String nombreLab;
  String ubicacion;

  Laboratorio({
    this.id,
    this.numero,
    this.municipio,
    this.nombreLab,
    this.ubicacion,
  });

  Laboratorio.fromMap(Map snapshot, String id)
      : id = id ?? '',
        numero = snapshot['numero'] ?? '',
        municipio = snapshot['municipio'] ?? '',
        nombreLab = snapshot['nombreLab'] ?? '',
        ubicacion = snapshot['ubicacion'] ?? '';

  toJson() {
    return {
      "numero": numero,
      "municipio": municipio,
      "nombreLab": nombreLab,
      "ubicacion": ubicacion,
    };
  }
}

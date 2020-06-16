class Department {
  String id;
  String nombre;
  String confirmados;
  String decesos;
  String recuperados;

  Department({
    this.id,
    this.nombre,
    this.confirmados,
    this.decesos,
    this.recuperados,
  });

  Department.fromMap(Map snapshot, String id)
      : id = id ?? '',
        nombre = snapshot['nombre'] ?? '',
        confirmados = snapshot['confirmados'] ?? '',
        decesos = snapshot['decesos'] ?? '',
        recuperados = snapshot['recuperados'] ?? '';

  toJson() {
    return {
      "nombre": nombre,
      "confirmados": confirmados,
      "decesos": decesos,
      "recuperados": recuperados,
    };
  }
}

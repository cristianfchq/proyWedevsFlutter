class Department {
  String id;
  String nombre;
  String confirmados;
  String decesos;
  String recuperados;
  int numero;
  String img;

  Department({
    this.id,
    this.nombre,
    this.confirmados,
    this.decesos,
    this.recuperados,
    this.numero,
    this.img,
  });

  Department.fromMap(Map snapshot, String id)
      : id = id ?? '',
        nombre = snapshot['nombre'] ?? '',
        confirmados = snapshot['confirmados'] ?? '',
        decesos = snapshot['decesos'] ?? '',
        recuperados = snapshot['recuperados'] ?? '',
        numero = snapshot['numero'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "nombre": nombre,
      "confirmados": confirmados,
      "decesos": decesos,
      "recuperados": recuperados,
      "numero": numero,
      "img": img,
    };
  }
}

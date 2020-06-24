class Noticias {
  String id;
  String resumen;
  String img;
  String titulo;
  int numero;
  

  Noticias({
    this.id,
    this.resumen,
    this.titulo,
    this.numero,
    this.img,
  });

  Noticias.fromMap(Map snapshot, String id)
      : id = id ?? '',
        resumen = snapshot['resumen'] ?? '',
        img = snapshot['img'] ?? '',
        titulo = snapshot['titulo'] ?? '',
        numero = snapshot['numero'] ?? '';

  toJson() {
    return {
      "resumen": resumen,
      "titulo": titulo,
      "numero": numero,
      "img": img,
    };
  }
}
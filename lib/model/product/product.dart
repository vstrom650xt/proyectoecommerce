class product {
  String id;
  String nombre;
  String imageUrl;
  double precio;
  String descripcion;
  bool esMasVendido;
  String status;
  String marca;

  product({
    required this.id,
    required this.nombre,
    required this.imageUrl,
    required this.precio,
    required this.descripcion,
    required this.esMasVendido,
    required this.status,
    required this.marca, required String productId,
  });

  factory product.fromJson(Map<String, dynamic> json) {
    return product(
      id: json['id'],
      nombre: json['nombre'],
      imageUrl: json['imageUrl'],
      precio: json['precio'],
      descripcion: json['descripcion'],
      esMasVendido: json['esMasVendido'],
      status: json['status'],
      marca: json['marca'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'imageUrl': imageUrl,
      'precio': precio,
      'descripcion': descripcion,
      'esMasVendido': esMasVendido,
      'status': status,
      'marca': marca, // Incluirlo en el JSON
    };
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'categorias';

  

  Future<void> agregarCategoria(String nombre, String url) async {
    await _db.collection(_collectionName).add({
      'nombre': nombre,
      'url': url,
    });
  }

  Future<void> actualizarCategoria(String id, String nombre, String url) async {
    await _db.collection(_collectionName).doc(id).update({
      'nombre': nombre,
      'url': url,
    });
  }

  Future<void> eliminarCategoria(String id) async {
    await _db.collection(_collectionName).doc(id).delete();
  }
}
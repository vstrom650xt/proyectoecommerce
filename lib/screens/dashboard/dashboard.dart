import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _categoryNameController = TextEditingController();
  final _categoryUrlController = TextEditingController();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productBrandController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productUrlController = TextEditingController();

  @override
  void dispose() {
    _categoryNameController.dispose();
    _categoryUrlController.dispose();
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productBrandController.dispose();
    _productPriceController.dispose();
    _productUrlController.dispose();
    super.dispose();
  }

  Future<void> _addCategory() async {
    String name = _categoryNameController.text;
    String url = _categoryUrlController.text;

    await FirebaseFirestore.instance.collection('categorias').add({
      'nombre': name,
      'url': url,
    });

    _categoryNameController.clear();
    _categoryUrlController.clear();
  }

  Future<void> _addProduct() async {
    String categoryId = ''; // Obtén el ID de la categoría
    String description = _productDescriptionController.text;
    String brand = _productBrandController.text;
    bool masVendido = false; // Cambia esto según sea necesario
    String name = _productNameController.text;
    double price = double.parse(_productPriceController.text);
    String url = _productUrlController.text;

    await FirebaseFirestore.instance.collection('productos').add({
      'categoria': categoryId,
      'descripcion': description,
      'marca': brand,
      'masVendido': masVendido,
      'nombre': name,
      'precio': price,
      'url': url,
    });

    _productNameController.clear();
    _productDescriptionController.clear();
    _productBrandController.clear();
    _productPriceController.clear();
    _productUrlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agregar Categoría',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _categoryNameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: _categoryUrlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCategory,
              child: Text('Agregar Categoría'),
            ),
            SizedBox(height: 40),
            Text(
              'Agregar Producto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: _productDescriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextFormField(
              controller: _productBrandController,
              decoration: InputDecoration(labelText: 'Marca'),
            ),
            TextFormField(
              controller: _productPriceController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _productUrlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}

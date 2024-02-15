import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddCategoryCard(),
            const SizedBox(height: 16),
            const AddProductCard(),
          ],
        ),
      ),
    );
  }
}

class AddCategoryCard extends StatelessWidget {
  const AddCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryNameController =
        TextEditingController();
    final TextEditingController categoryUrlController =
        TextEditingController();

    void addCategory() async {
      String name = categoryNameController.text;
      String url = categoryUrlController.text;

      await FirebaseFirestore.instance.collection('categorias').add({
        'nombre': name,
        'url': url,
      });

      categoryNameController.clear();
      categoryUrlController.clear();
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregar Categoría',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: categoryNameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: categoryUrlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addCategory,
              child: const Text('Agregar Categoría'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductCard extends StatelessWidget {
  const AddProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController =
        TextEditingController();
    final TextEditingController productDescriptionController =
        TextEditingController();
    final TextEditingController productBrandController =
        TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productUrlController =
        TextEditingController();
    final TextEditingController productCategoryController =
        TextEditingController();
    final TextEditingController productMostSaleController =
        TextEditingController();

    void addProduct() async {
      String categoryId = ''; // Obtén el ID de la categoría
      String description = productDescriptionController.text;
      String brand = productBrandController.text;
      bool mostSale = productMostSaleController.text.toLowerCase() == 'true';
      String name = productNameController.text;
      double price = double.parse(productPriceController.text);
      String url = productUrlController.text;
      String category = productCategoryController.text.toLowerCase();

      // Obtener el ID autoincremental
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('productos').get();
      final int nextID = querySnapshot.size + 1;
      
      await FirebaseFirestore.instance.collection('productos').add({
        'id': nextID.toString(),
        'descripcion': description,
        'marca': brand,
        'masVendido': mostSale,
        'nombre': name,
        'precio': price,
        'categoria': category,
        'url': url,
      });

      productNameController.clear();
      productDescriptionController.clear();
      productBrandController.clear();
      productPriceController.clear();
      productUrlController.clear();
      productCategoryController.clear();
      productMostSaleController.clear();
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregar Producto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: productDescriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextFormField(
              controller: productBrandController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextFormField(
              controller: productPriceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: productUrlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            TextFormField(
              controller: productCategoryController,
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
            TextFormField(
              controller: productMostSaleController,
              decoration: const InputDecoration(
                  labelText: '¿Más vendido? (true/false)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: const Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}

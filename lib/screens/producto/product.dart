import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';

class Product extends StatefulWidget {
  final String productId;

  const Product({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Agregar un appbar para colocar TopTitles arriba
        title: TopTitles(subtitle: "", title: ""),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500, // Tamaño máximo en PC
                ),
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('productos')
                                  .doc(widget.productId)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final productData = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                final productImageUrl =
                                    productData['url'] as String;
                                final productName =
                                    productData['nombre'] as String;
                                final productPrice =
                                    productData['precio'] as double;
                                final productDescription =
                                    productData['descripcion'] as String;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        productImageUrl,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      productName,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$$productPrice',
                                      style: const TextStyle(
                                          fontSize: 20.0, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 0),
                                    const Text(
                                      'Description:',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      productDescription,
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (_quantity > 1) {
                                              setState(() {
                                                _quantity--;
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text(
                                          '$_quantity',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _quantity++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Add action here
                                        print(
                                            'Add to Cart: Product ID - ${widget.productId}, Quantity - $_quantity');
                                            
                                      },
                                      child: const Text('Add to Cart'),
                                      
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

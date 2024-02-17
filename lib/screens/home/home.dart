import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoecommerce/screens/producto/product.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients) {
        _scrollController
            .animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 4),
          curve: Curves.ease,
        )
            .then((_) {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            _scrollController.jumpTo(0);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopTitles(subtitle: "", title: ""),
                const Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    "familias",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: _buildCategoryImages(),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Mas vendidos",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _buildMasVendidosList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryImages() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categorias').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<DocumentSnapshot> categories = snapshot.data!.docs;

        return Row(
          children: categories.map((category) {
            final imageUrl = category['url'] as String;
            final productId = category.id; // Obtener el ID del producto
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print(productId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Product(productId: productId),
                    ),
                  );
                },
                child: Image.network(
                  imageUrl,
                  width: 150,
                  height: 150,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildMasVendidosList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productos')
          .where('masVendido', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<DocumentSnapshot> products = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(context),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final productId = products[index].id;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(productId: productId),
                  ),
                );
              },
              child: _buildProductItem(products[index]),
            );
          },
        );
      },
    );
  }

  Widget _buildProductItem(DocumentSnapshot productSnapshot) {
    final productData = productSnapshot.data() as Map<String, dynamic>;
    final productImageUrl = productData['url'] as String;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Image.network(
          productImageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    // Decide the number of items per row based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        (screenWidth / 200).floor(); // Width of each item is 200
    return crossAxisCount;
  }
}

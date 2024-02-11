import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';
import 'dart:async';
import 'package:proyectoecommerce/widgets/card_producto/ProductCard.dart';

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
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients) {
        _scrollController
            .animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 4),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(subtitle: "", title: "E-Commerce"),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Buscar ...."),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Mas Vendidos",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildImageCards(),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              "Categorias",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Si el ancho de la pantalla es mayor a 600 (se está viendo en PC)
                    return _buildGridView(4); // 4 columnas
                  } else {
                    return _buildGridView(2); // 2 columnas
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(int crossAxisCount) {
    return FutureBuilder(
      future: _getCategorias(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final categoria = snapshot.data!.docs[index];
            return Container(
              width: 150, // Ancho deseado del contenedor
              height: 150, // Alto deseado del contenedor
              color: Colors.red.shade100,
            );
          },
        );
      },
    );
  }

  List<Widget> _buildImageCards() {
    List<Widget> cards = [];
    for (int i = 0; i < 10; i++) {
      cards.add(
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(
              "lib/img/pc.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }
    return cards;
  }

  Future<QuerySnapshot> _getCategorias() async {
    return await FirebaseFirestore.instance.collection('categorias').get();
  }
}

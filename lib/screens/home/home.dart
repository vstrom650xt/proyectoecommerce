import 'package:flutter/material.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';
import 'dart:async';

////////////////////////////// 2:23
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
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildImageCards(),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Categorias",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildImageCards() {
    List<Widget> cards = [];
    for (int i = 0; i < 10; i++) {
      cards.add(
        Card(
          color: Colors.white,
          //  elevation: 1.0,
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
}

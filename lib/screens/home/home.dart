import 'package:flutter/material.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';

class Home extends StatelessWidget {
  const Home({Key? key});
////////////////////////////2:03:02
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TopTitles(subtitle: "12313", title: "E-Commerce"),
          ),
          TextFormField(),
        ],
      ),
    );
  }
}

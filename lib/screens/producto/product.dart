import 'package:flutter/material.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';

class product extends StatelessWidget {
  const product({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopTitles(subtitle: "", title: ""),
              ],
            ),
          )
        ],
      ),
    );
  }
}

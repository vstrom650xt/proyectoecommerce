import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String subtitle;
  final String title;

  const TopTitles({Key? key, required this.subtitle, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Title: $title'),
        Text('Subtitle: $subtitle'),
      ],
    );
  }
}

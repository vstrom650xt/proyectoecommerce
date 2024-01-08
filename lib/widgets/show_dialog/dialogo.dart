import 'package:flutter/material.dart';

class dialogo extends StatelessWidget {
  final String textoSuperior;
  final String textInferior;

  const dialogo(
      {Key? key, required this.textoSuperior, required this.textInferior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(textoSuperior),
      content: Text(textInferior),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final List<IconData> icons;

  const IconRow({Key? key, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Column(
      children: [
        SizedBox(height: 10),
        isLargeScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: icons.map((icon) => _buildIconButton(icon)).toList(),
              )
            : Column(
                children: List.generate(
                  (icons.length / 2).ceil(),
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: icons
                        .skip(index * 2)
                        .take(2)
                        .map((icon) => _buildIconButton(icon))
                        .toList(),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildIconButton(IconData iconData) {
    return Column(
      children: [
        Icon(iconData, size: 40),
        SizedBox(height: 5),
        Text(
          _getIconName(iconData),
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  String _getIconName(IconData iconData) {
    // Aquí podrías implementar la lógica para obtener el nombre del icono
    // en función del IconData
    return iconData.toString();
  }
}

import 'package:flutter/material.dart';

import '../text_custom.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.cost,
  });

  final String image;

  final String name;

  final double cost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          image,
          width: 80,
        ),
        title: TextCustom(text: name, fontWeight: FontWeight.bold),
        trailing: TextCustom(
          text: '- \$$cost',
        ),
      ),
    );
  }
}

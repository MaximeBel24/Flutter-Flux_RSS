import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {

  final String imageUrl;

  const ImageView({Key? key, required this.imageUrl}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 4,
      ),
    );
  }
}
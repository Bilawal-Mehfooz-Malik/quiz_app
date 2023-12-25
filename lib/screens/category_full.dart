import 'package:flutter/material.dart';

class CategoryFullScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  static const String routeName = 'CategoryFullScreen';

  const CategoryFullScreen({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: imageUrl, child: Image.network(imageUrl)),
    );
  }
}

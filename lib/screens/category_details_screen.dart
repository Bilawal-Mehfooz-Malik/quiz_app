import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const String routeName = 'CategoryDetailsScreen';
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Details'),
      ),
    );
  }
}

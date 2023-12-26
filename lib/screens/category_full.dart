import 'package:flutter/material.dart';
import 'package:quiz_app/common/shimmer_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryFullScreen extends StatelessWidget {
  final String imageUrl;
  static const String routeName = 'CategoryFullScreen';
  const CategoryFullScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        
        placeholder: (context, url) => const ShimmerLoader(),
      ),
    );
  }
}

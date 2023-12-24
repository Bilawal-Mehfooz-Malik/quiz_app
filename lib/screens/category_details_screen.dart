import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/categories_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quiz_app/data/category_details_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const String routeName = 'CategoryDetailsScreen';
  final String title;

  const CategoryDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final data = categoryDetailsData[title] ?? [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: data.map<Widget>((item) {
                final index = data.indexOf(item);
                return CategoryCard(
                    title: item, imageUrl: categoriesImages[index]);
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
            ),
            const Spacer(),
            const CicularWheel(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(color: Colors.white),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CicularWheel extends StatelessWidget {
  const CicularWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}

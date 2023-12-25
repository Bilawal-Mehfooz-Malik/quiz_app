import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/categories_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quiz_app/data/category_details_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quiz_app/providers/category_details_provider.dart';

import '../widgets/cicular_wheel_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  static const String routeName = 'CategoryDetailsScreen';

  const CategoryDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final data = categoryDetailsData[title] ?? [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Consumer<CategoryDetailsProvider>(
          builder: (context, provider, child) => Column(
            children: [
              //* Slider at top
              CarouselSlider(
                carouselController: provider.carouselController,
                items: data.map<Widget>((item) {
                  final index = data.indexOf(item);
                  return CategoryCard(
                      title: item, imageUrl: categoriesImages[index]);
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.4,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlay: provider.isPlayed,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
              ),
              const Spacer(),

              //* Circular wheel at bottom
              CicularWheel(
                play: provider.autoPlay,
                stop: provider.stopPlay,
                isplayed: provider.isPlayed,
                forwardCallback: provider.nextPage,
                reverseCallback: provider.previousPage,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

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

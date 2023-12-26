import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../common/shimmer_loader.dart';
import '../data/category_details_data.dart';
import '../widgets/cicular_wheel_widget.dart';
import '../providers/category_details_provider.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  static const String routeName = 'CategoryDetailsScreen';

  const CategoryDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
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
                  final imageUrl = data[index]['imageUrl'] ?? '';
                  final subtopicTitle = data[index]['title'] ?? '';
                  return CategoryCard(title: subtopicTitle, imageUrl: imageUrl);
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.4,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlay: provider.isPlayed,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    pageIndex = index;
                  },
                ),
              ),
              const Spacer(),

              //* Circular wheel at bottom
              CicularWheel(
                play: provider.autoPlay,
                stop: provider.stopPlay,
                isplayed: provider.isPlayed,
                details: () {
                  final url = data[pageIndex]['imageUrl'];
                  provider.detailsPage(context, url!);
                },
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
                return const ShimmerLoader();
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

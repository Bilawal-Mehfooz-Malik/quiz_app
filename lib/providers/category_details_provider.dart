import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../screens/category_full.dart';

class CategoryDetailsProvider extends ChangeNotifier {
  var _isPlayed = false;
  final _carouselController = CarouselController();

  bool get isPlayed => _isPlayed;
  CarouselController get carouselController => _carouselController;

  void autoPlay() {
    _carouselController.startAutoPlay();
    _isPlayed = true;
    notifyListeners();
  }

  void stopPlay() {
    _carouselController.stopAutoPlay();
    _isPlayed = false;
    notifyListeners();
  }

  void nextPage() {
    _carouselController.nextPage();
  }

  void previousPage() {
    _carouselController.previousPage();
  }

  void detailsPage(BuildContext context, String url, String title) {
    context.goNamed(
      CategoryFullScreen.routeName,
      pathParameters: {'imageUrl': url, 'subtopicTitle': title},
    );
  }
}

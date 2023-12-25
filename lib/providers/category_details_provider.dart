import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
}

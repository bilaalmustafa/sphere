import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CostomCarousalSlider extends StatelessWidget {
  const CostomCarousalSlider({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        animateToClosest: true,
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
      items: imageList
          .map((item) => Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(item),
                    fit: BoxFit.fill,
                    width: 1000,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

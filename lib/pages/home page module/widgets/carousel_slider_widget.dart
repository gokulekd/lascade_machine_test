import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lascade_machine_test/constant/network_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int scrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          items: carouselSliderImageList.map((item) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            pageSnapping: true,
            onPageChanged: (index, reason) {
              setState(() {
                scrollIndex = index;
              });
            },
            height: 200,
            autoPlay: false,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
          ),
        ),
        Positioned.fill(
          bottom: 30,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
                effect: const ScaleEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.yellow,
                ),
                activeIndex: scrollIndex,
                count: carouselSliderImageList.length),
          ),
        ),
  
      ],
    );
  }
}

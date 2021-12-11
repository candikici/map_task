import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';

ClipRRect buildCarouselImage(double width, String imageUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: width,
    ),
  );
}

Stack buildCarouselSlider(
  AppViewModel app,
  List<Widget> imageList,
  BuildContext context,
) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CarouselSlider(
          items: imageList,
          options: CarouselOptions(
            height: 205,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: imageList.length > 1 ? true : false,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) => app.setImageIndex(index),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return Container(
              width: app.currentPhotoIndex == entry.key ? 20.0 : 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.white)
                    .withOpacity(
                  app.currentPhotoIndex == entry.key ? 1 : 0.5,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}

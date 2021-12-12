import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/components/carousel_slider.dart';
import 'package:map_task/constants/app_constants.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:map_task/widgets/detail_row_widget.dart';

Column buildDetailColumn(
  AppViewModel app,
  BuildContext context,
  SearchResult place,
  List<Widget> imageList,
) {
  return Column(
    children: [
      imageList.isEmpty
          ? const SizedBox(
              height: 205,
              child: Center(
                  child: Text(
                "No photo found.",
                style: AppContants.W600S12TG,
              )),
            )
          : buildCarouselSlider(app, imageList, context),
      const SizedBox(height: 25),
      Text(
        place.name ?? "-",
        textAlign: TextAlign.center,
        style: AppContants.W600S16B,
      ),
      const SizedBox(height: 15),
      DetailRow(
        title: "Address:",
        text: place.formattedAddress,
        isAddress: true,
      ),
      const SizedBox(height: 15),
      DetailRow(
        title: "Operational\nStatus:",
        text: place.businessStatus,
      ),
      const SizedBox(height: 15),
      DetailRow(
        title: "Average Rating:",
        text: place.rating?.toString(),
        isIconic: true,
      ),
      const SizedBox(height: 15),
      DetailRow(
        title: "Total Review Number:",
        text: place.userRatingsTotal?.toString(),
      ),
    ],
  );
}

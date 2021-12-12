import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:provider/provider.dart';

import '../components/carousel_slider.dart';
import '../components/detail_cmp.dart';
import '../components/main_components.dart';
import '../viewmodel/app_viewmodel.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.place}) : super(key: key);
  final SearchResult place;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<Widget> imageList = [];
  var isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);

  initialize() async {
    changeLoading();
    var app = Provider.of<AppViewModel>(context, listen: false);
    await app.setImageIndex(0, false);
    if (widget.place.photos != null) {
      for (var i = 0; i < widget.place.photos!.length; i++) {
        imageList.add(
          buildCarouselImage(
            app.queryWidth - 40,
            app.placeService
                .getPhotoURL(widget.place.photos![i].photoReference!),
          ),
        );
      }
    }
    changeLoading();
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: widget.place.name ?? ""),
      body: Consumer<AppViewModel>(
        builder: (context, app, child) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: SingleChildScrollView(
                  child: buildDetailColumn(
                    app,
                    context,
                    widget.place,
                    imageList,
                  ),
                ),
              ),
      ),
    );
  }
}

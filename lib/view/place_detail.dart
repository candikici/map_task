import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/components/carousel_slider.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(),
      body: Consumer<AppViewModel>(
        builder: (context, app, child) => Column(
          children: [
            imageList.isEmpty
                ? const SizedBox(
                    height: 205,
                    child: Center(child: Text("Fotoğraf Bulunamadı.")),
                  )
                : buildCarouselSlider(app, imageList, context),
            Text(widget.place.name ?? "not informed"),
            Text(widget.place.formattedAddress ?? "not informed"),
            Text(widget.place.businessStatus ?? "not informed"),
            Text(widget.place.rating?.toString() ?? "not informed"),
            Text(widget.place.userRatingsTotal?.toString() ?? "not informed"),
          ],
        ),
      ),
    );
  }
}

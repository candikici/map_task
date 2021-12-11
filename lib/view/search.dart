import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:map_task/constants/app_constants.dart';
import 'package:map_task/utility/route.dart';
import 'package:map_task/view/map.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Challenge"),
      ),
      body: Consumer<AppViewModel>(
        builder: (context, vm, child) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    hintText: "Search", labelText: "Search"),
                onChanged: (searchKey) async {
                  changeLoading();
                  await vm.getPlaces(searchKey);
                  changeLoading();
                },
              ),
              if (vm.placeResults != null &&
                  vm.placeResults is List<SearchResult>)
                const SizedBox(height: 20),
              if (isLoading)
                const CircularProgressIndicator(
                  color: AppContants.BLUE,
                ),
              if (vm.placeResults != null &&
                  vm.placeResults is List<SearchResult> &&
                  !isLoading)
                Expanded(
                  child: vm.placeResults.isEmpty
                      ? const Center(child: Text("Sonuç Bulunamadı."))
                      : ListView.builder(
                          itemCount: vm.placeResults.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              onTap: () => Navigator.push(
                                context,
                                createRoute(
                                  Map(
                                    place: vm.placeResults[i],
                                  ),
                                ),
                              ),
                              leading: Image.network(
                                (vm.placeResults[i] as SearchResult).icon!,
                                height: 30,
                                width: 30,
                              ),
                              title: Text(
                                (vm.placeResults[i] as SearchResult).name ??
                                    "-",
                                style: AppContants.W600S14TG,
                              ),
                            );
                          },
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

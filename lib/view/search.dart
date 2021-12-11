import 'package:flutter/material.dart';
import 'package:map_task/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppViewModel>(
        builder: (context, vm, child) => Column(),
      ),
    );
  }
}

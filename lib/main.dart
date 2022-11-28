import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:developer';
import 'playerBox.dart';
import 'menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainGrid()
    );
  }
}

class MainGrid extends StatefulWidget {
  const MainGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainGrid();
  }
}

class _MainGrid extends State<MainGrid> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    const numberOfPlayers = 4;

    return Scaffold(
      body: Stack (
        children: <Widget> [
          StaggeredGrid.count(
            crossAxisCount: 2,
            axisDirection: AxisDirection.down,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              StaggeredGridTile.extent(
                crossAxisCellCount: numberOfPlayers > 2 ? 1 : 2,
                mainAxisExtent: height * 0.5,
                child: const PlayerBox(1, numberOfPlayers),
              ),
              StaggeredGridTile.extent(
                crossAxisCellCount: numberOfPlayers > 2 ? 1 : 2,
                mainAxisExtent: height * 0.5,
                child: const PlayerBox(2, numberOfPlayers),
              ),
              StaggeredGridTile.extent(
                crossAxisCellCount: numberOfPlayers > 3 ? 1 : 2,
                mainAxisExtent: height * 0.5,
                child: const PlayerBox(3, numberOfPlayers),
              ),
              StaggeredGridTile.extent(
                crossAxisCellCount: numberOfPlayers > 3 ? 1 : 2,
                mainAxisExtent: height * 0.5,
                child: const PlayerBox(4, numberOfPlayers),
              ),
            ],
          ),
          const Center(
            child: Menu(),
          )
        ],
      ),
    );
  }
}
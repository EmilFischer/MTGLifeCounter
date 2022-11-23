import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return Scaffold(
      body: Stack(
        children: <Widget> [
          const MainGrid(),
          Center(
            child: IconButton(
              icon: Image.asset('assets/images/MTGLogo.png'),
              padding: const EdgeInsets.all(0.0),
              iconSize: 50,
              onPressed: () {},
            ),
          )
        ],
      ),
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
      body: StaggeredGrid.count(
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
    );
  }
}

class PlayerBox extends StatefulWidget {
  const PlayerBox(this.playerNumber, this.numberOfPlayers, {super.key});
  final int playerNumber;
  final int numberOfPlayers;

  @override
  State<StatefulWidget> createState() {
    return _PlayerBox();
  }
}

class _PlayerBox extends State<PlayerBox> {

  int getTextOrientation() {
    var numOfPlayers = widget.numberOfPlayers;
    var playerNum = widget.playerNumber;
    if (numOfPlayers == 2) {
      if (playerNum == 1){
        return 2;
      }
    }
    if (numOfPlayers == 3){
      if (playerNum == 1){
        return 1;
      }
      if (playerNum == 2){
        return -1;
      }
    }
    if (numOfPlayers == 4) {
      if (playerNum == 1){
        return 1;
      }
      if (playerNum == 2){
        return -1;
      }
      if (playerNum == 3){
        return 1;
      }
      if (playerNum == 4){
        return -1;
      }
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var color = const Color.fromRGBO(0, 0, 0, 1);
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Counter(getTextOrientation())
    );
  }
}
class Counter extends StatefulWidget {
  const Counter(this.orientation, {super.key});
  final int orientation;

  @override
  State<StatefulWidget> createState() {
    return _Counter();
  }
}

class _Counter extends State<Counter> {
  var life = 40;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.orientation,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {setState(() {
              life--;
            });},
            child: const Text('-'),
          ),
          Text(
            life.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 40
            )
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {setState(() {
              life++;
            });},
            child: const Text('+'),
          ),
        ],
      )
    );
  }
}
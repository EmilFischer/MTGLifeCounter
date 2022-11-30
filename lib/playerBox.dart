import 'package:flutter/material.dart';
import 'colorPicker.dart';
import 'counter.dart';

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

  AssetImage image = const AssetImage("assets/images/GreenBackground.jpg");
  void setBackground(MTGColor color) {
    if (color == MTGColor.black){
      setState(() {
        image = const AssetImage("assets/images/BlackBackground.jpg");
      });
    }
    else if (color == MTGColor.blue) {
      setState(() {
        image = const AssetImage("assets/images/BlueBackground.jpg");
      });
    }
    else if (color == MTGColor.white) {
      setState(() {
        image = const AssetImage("assets/images/WhiteBackground.jpg");
      });
    }
    else if (color == MTGColor.red) {
      setState(() {
        image = const AssetImage("assets/images/RedBackground.jpg");
      });
    }
    else if (color == MTGColor.green) {
      setState(() {
        image = const AssetImage("assets/images/GreenBackground.jpg");
      });
    }
    else if (color == MTGColor.colorless) {
      setState(() {
        image = const AssetImage("assets/images/ColorlessBackground.jpg");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double? right = 25;
    double? left;
    if (widget.playerNumber == 2 || widget.playerNumber == 3) {
      right = null;
      left = 25;
    }

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return RotatedBox(
      quarterTurns: getTextOrientation(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover
          ),
        ),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            backgroundColor: const Color.fromRGBO(128, 128, 128, 0.7),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget> [
                IconButton(
                  icon: Image.asset('assets/images/BlackMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.black);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/BlueMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.blue);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/GreenMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.green);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/RedMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.red);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/WhiteMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.white);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/ColorlessMana.png'),
                  onPressed: () {
                    setBackground.call(MTGColor.colorless);
                    Scaffold.of(context).closeDrawer();
                  },
                ),
              ],
            ),
          ),
          body: Stack(
            children: <Widget> [
              Positioned(
                top: 25,
                right: right,
                left: left,
                child: IconButton(
                  icon: const Icon(
                    Icons.circle_outlined,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        blurRadius: 10
                      )
                    ],
                  ),
                  iconSize: 40,
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
              const Center(
                child: Counter(),
              )
            ],
          ),
        )
      ),
    );
  }
}
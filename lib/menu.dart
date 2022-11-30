import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mtg_life_counter/strokedText.dart';

class Menu extends StatefulWidget {
  const Menu(this.setNumberOfPlayers, this.resetLife, {super.key});
  final void Function(int) setNumberOfPlayers;
  final void Function() resetLife;

  @override
  State<StatefulWidget> createState() {
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var isMainDrawer = true;

  Drawer getMainDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(
            width: 100,
            height: 70,
            child: IconButton(
              icon: const Icon(Icons.refresh),
              color: Colors.white,
              onPressed: () {
                widget.resetLife();
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 70,
            child: IconButton(
              icon: const Icon(Icons.person_add),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  isMainDrawer = false;
                });
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 70,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.redAccent,
              onPressed: () {
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
          )
        ],
      ),
    );
  }

  Drawer getPlayerPickerDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(
            width: 100,
            height: 70,
            child: TextButton(
              child: const StrokedText('2', size: 20),
              onPressed: () {
                setState(() {
                  isMainDrawer = true;
                });
                widget.setNumberOfPlayers(2);
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 70,
            child: TextButton(
              child: const StrokedText('3', size: 20),
              onPressed: () {
                setState(() {
                  isMainDrawer = true;
                });
                widget.setNumberOfPlayers(3);
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 70,
            child: TextButton(
              child: const StrokedText('4', size: 20),
              onPressed: () {
                setState(() {
                  isMainDrawer = true;
                });
                widget.setNumberOfPlayers(4);
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 70,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: isMainDrawer ? getMainDrawer() : getPlayerPickerDrawer(),
        body: Center(
          child: SizedBox(
            height: 70,
            width: 70,
            child: IconButton(
              icon: Image.asset('assets/images/MTGLogo.png'),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
        )
      ),
    );
  }
}
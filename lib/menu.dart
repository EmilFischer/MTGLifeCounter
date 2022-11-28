import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var visible = true;

    return SizedBox(
      height: 70,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(128, 128, 128, 0.7),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SizedBox(
                width: 100,
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      visible = true;
                    });
                    scaffoldKey.currentState!.closeDrawer();
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: IconButton(
                  icon: const Icon(Icons.person_add),
                  onPressed: () {
                    setState(() {
                      visible = true;
                    });
                    scaffoldKey.currentState!.closeDrawer();
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      visible = true;
                    });
                    scaffoldKey.currentState!.closeDrawer();
                  },
                ),
              )
            ],
          ),

        ),
        body: Center(
          child: Visibility(
            visible: visible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: SizedBox(
              height: 70,
              width: 70,
              child: IconButton(
                icon: Image.asset('assets/images/MTGLogo.png'),
                onPressed: () {
                  setState(() {
                    visible = false;
                  });
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          ),
        )
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stjean_douai_app/main.dart';
import 'package:stjean_douai_app/components/info_card.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          color: d_color,
          child: SafeArea(
              child: Column(
            children: [
              InfoCard(
                name: "Benjamin",
                option: "developper",
              ),
            ],
          )),
        ),
      ),
    );
  }
}


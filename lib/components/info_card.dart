import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stjean_douai_app/components/side_menu.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.name, required this.option})
      : super(key: key);

  final String name, option;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.blue,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        option,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

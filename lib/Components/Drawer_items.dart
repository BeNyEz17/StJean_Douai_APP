import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}

class ListTileDivider extends StatelessWidget {
  const ListTileDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
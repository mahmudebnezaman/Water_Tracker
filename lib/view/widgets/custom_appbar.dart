import 'package:flutter/material.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    leading: Icon(
      Icons.water_drop_outlined,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.info_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ],
  );
}

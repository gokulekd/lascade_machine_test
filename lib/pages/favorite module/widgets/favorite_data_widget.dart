import 'package:flutter/material.dart';

Widget favoriteDataWidget({required IconData icon, required String name}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 8, right: 5),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 22, 144, 204),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ]),
      ),
    ),
  );
}

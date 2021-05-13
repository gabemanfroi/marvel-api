import 'package:flutter/material.dart';
import 'package:marvel_heroes/utils/constants.dart';

Widget buildBottomNavigationBar() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Início',
        backgroundColor: colorRed00,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Favoritos',
        backgroundColor: colorRed00,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Pesquisar',
        backgroundColor: colorRed00,
      ),
    ],
    selectedItemColor: Colors.white,
    backgroundColor: colorRed02,
  );
}

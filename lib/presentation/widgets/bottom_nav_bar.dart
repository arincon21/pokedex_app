import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 3,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(top:12),
          child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.blue : Colors.grey,
                size: 25,
              ),
              label: 'Pokedex',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: currentIndex == 1 ? Colors.blue : Colors.grey,
                size: 25,
              ),
              label: 'Regiones',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 2 ? Colors.blue : Colors.grey,
                size: 25,
              ),
              label: currentIndex == 2 ? 'favoritos' : 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: currentIndex == 3 ? Colors.blue : Colors.grey,
                size: 25,
              ),
              label: 'Perfil',
            ),
          ],
          ),
        ),
      );
  }
}
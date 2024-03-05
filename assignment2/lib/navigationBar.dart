import 'package:assignment2/bag.dart';
import 'package:assignment2/favourite.dart';
import 'package:assignment2/home.dart';
import 'package:assignment2/location.dart';
import 'package:flutter/material.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _index = 0;
  final List<Widget> _pages = <Widget>[
    const Home(),
    const Location(),
    const Bag(),
    const Favourite(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(_index == 0 ? Icons.home : Icons.home_outlined,
                  color: _index == 0
                      ? const Color.fromRGBO(238, 81, 81, 1)
                      : null),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                  _index == 1 ? Icons.location_on : Icons.location_on_outlined,
                  color: _index == 1
                      ? const Color.fromRGBO(238, 81, 81, 1)
                      : null),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                  _index == 2
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined,
                  color: _index == 2
                      ? const Color.fromRGBO(238, 81, 81, 1)
                      : null),
              label: "",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                  _index == 3 ? Icons.favorite : Icons.favorite_border_outlined,
                  color: _index == 3
                      ? const Color.fromRGBO(238, 81, 81, 1)
                      : null),
              label: "",
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}

import 'package:eventement_mobile/ui/pages/AjouterEvent.dart';
import 'package:eventement_mobile/ui/pages/MyEvent.dart';
import 'package:eventement_mobile/ui/pages/MyMessage.dart';
import 'package:eventement_mobile/ui/pages/MyProfile.dart';
import 'package:eventement_mobile/ui/pages/homePage.dart';
import 'package:flutter/material.dart';

class MyNavBarButtom extends StatefulWidget {
  const MyNavBarButtom({Key? key}) : super(key: key);

  @override
  State<MyNavBarButtom> createState() => _MyNavBarButtomState();
}

class _MyNavBarButtomState extends State<MyNavBarButtom> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyMessage(),
    const AddEvent(),
    const MyEvent(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: _currentIndex == 0
                  ? const Color.fromRGBO(85, 105, 254, 1.0)
                  : Colors.grey,
            ),
            label: "home ",

            // textStyle: TextStyle(color: Colors.black12),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _currentIndex == 1
                  ? const Color.fromRGBO(85, 105, 254, 1.0)
                  : Colors.grey,
              size: 30,
            ),
            label: "msg",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
              color: _currentIndex == 2
                  ? const Color.fromRGBO(85, 105, 254, 1.0)
                  : Colors.grey,
            ),
            label: "add ",

            // textStyle: TextStyle(color: Colors.black12),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
              color: _currentIndex == 3
                  ? const Color.fromRGBO(85, 105, 254, 1.0)
                  : Colors.grey,
              size: 30,
            ),
            label: "event",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 4
                  ? const Color.fromRGBO(85, 105, 254, 1.0)
                  : Colors.grey,
              size: 30,
            ),
            label: "personne",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(index);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}

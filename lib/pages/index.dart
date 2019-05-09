import 'package:flutter/material.dart';
import 'package:transport_app/pages/favourite.dart';
import 'package:transport_app/pages/home.dart';
import 'package:transport_app/pages/terminal.dart';
import 'package:transport_app/pages/ticket.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(child: _IndexContent()),
    );
  }
}

class _IndexContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _IndexContentState();
  }
}

class _IndexContentState extends State<_IndexContent> {
  var currentIndex = 0;
  final List<Widget> tabItems = [
    HomePage(),
    TicketPage(),
    TerminalPage(),
    FavouritePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabItems[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), title: Text("Tickets")),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), title: Text("Terminal")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favourites")),
        ],
      ),
    );
  }

  showSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Tap'),
    ));
  }
}

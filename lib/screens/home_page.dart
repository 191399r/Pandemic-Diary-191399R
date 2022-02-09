import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';
import 'package:firebase_firestoreapp/screens/addrecord_page.dart';
import 'package:firebase_firestoreapp/screens/showrecords_page.dart';
import 'quote.dart';
import 'memories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _listPages = List();

  @override
  void initState() {
    super.initState();
    _listPages..add(RecordsPage())..add(Quotegen())..add(Memories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pandemic Diary', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            tooltip: 'Sign Out',
            onPressed: () async {
              await FirebaseAuthService().signOut();
              Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      ),
      body: SafeArea(
        child: _listPages[_currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        //shape property must be set to NotchedShape
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.book),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.cake),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showModalBottomSheet<Null>(
            context: context,
            builder: (BuildContext context) => AddRecordPage(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
} //HomePageState

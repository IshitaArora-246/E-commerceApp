import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Container(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0 ),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  "Mehak",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text("mehak_the_great24@gmail.com",
                    style: TextStyle(color: Colors.black)),
                currentAccountPicture: Image.asset(
                  "assets/images/m.jpg",
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text('My Profile',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text('Home',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.archivebox,
                color: Colors.black,
              ),
              title: Text('About',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.star,
                color: Colors.black,
              ),
              title: Text('Feedback',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.black,
              ),
              title: Text('Settings',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

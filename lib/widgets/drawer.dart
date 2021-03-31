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
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Image.asset("assets/images/m.jpg",
                            width: 75, height: 75)),
                    SizedBox(height: 5),
                    Text("Myra",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    Text("Myra1234@example.com",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500))
                  ],
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

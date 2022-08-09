import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://avatars.githubusercontent.com/u/91772554?s=400&u=6f62f957bde3a74705a7351ea898ae0bab7ed321&v=4";

    return Drawer(
      child:Container(
        color:Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text('Yash Shah'),
                  accountEmail: Text('nileshshah0409@yahoo.co.in'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:NetworkImage(imageUrl), //Image provider
                  )
                )
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                  color:Colors.white
              ),
              title:Text('Home',textScaleFactor:1.3,style: TextStyle(
                color:Colors.white,
              ),
              )

            ),
            ListTile(
                leading: Icon(
                    CupertinoIcons.profile_circled,
                    color:Colors.white
                ),
                title:Text('Profile',textScaleFactor:1.3,style: TextStyle(
                  color:Colors.white,
                ),
                )

            ),
            ListTile(
                leading: Icon(
                    CupertinoIcons.mail,
                    color:Colors.white
                ),
                title:Text('Email me',textScaleFactor:1.3,style: TextStyle(
                  color:Colors.white,
                ),
                )

            ),
          ],
        ),
      )
    );
  }
}

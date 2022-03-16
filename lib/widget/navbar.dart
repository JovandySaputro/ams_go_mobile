import 'package:ams_go_mobile/ui/favourites_page.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import '../data/user.dart';

class NavBar extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  final isSelected = false;

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(HomePage());
        break;
      case 1:
        navigateTo(HomePage());
        break;
      case 2:
        navigateTo(FavouritesPage());
        break;
      case 3:
        navigateTo(HomePage());
        break;
      case 4:
        navigateTo(HomePage());
        break;
      case 5:
        navigateTo(HomePage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff0096ff), Color(0xff6610f2)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight),
        ),
        child: ListView(
          // Remove padding

          padding: EdgeInsets.zero,
          children: [
            InkWell(
              // onTap: () => selectItem(context, NavigationItem.header),
              child: Container(
                padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewImgProfile();
                        }));
                      },
                      child: Hero(
                        tag: "pp",
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(urlImage)),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.white70),
            ExpansionTile(
              collapsedIconColor: Colors.white,
              leading: Icon(
                Icons.move_to_inbox,
                color: Colors.white,
              ),
              title: Text(
                'Surat Masuk',
                style: TextStyle(color: Colors.white),
              ),
              children: [
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Surat Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Surat Terkirim',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Detail Surat Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'View Surat Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.white70),
            ExpansionTile(
              collapsedIconColor: Colors.white,
              leading: Icon(
                Icons.outbox,
                color: Colors.white,
              ),
              title: Text(
                'Surat Keluar',
                style: TextStyle(color: Colors.white),
              ),
              children: [
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Persetujuan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Telusuri',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Konsep',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(64, 0),
                    child: Text(
                      'Terkirim',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.white70),
            ListTile(
              title: Text(
                'Exit',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.exit_to_app),
              iconColor: Colors.white,
              onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }
}

class ViewImgProfile extends StatelessWidget {
  const ViewImgProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
        title: Text(
          "Foto Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Hero(
          tag: "pp",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 200,
              height: 200,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

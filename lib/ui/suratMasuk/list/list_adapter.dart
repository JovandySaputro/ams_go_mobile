import 'package:ams_go_mobile/ui/List_Page.dart';
import 'package:ams_go_mobile/ui/profile_page.dart';
import 'package:ams_go_mobile/ui/suratMasuk/detail/detail_surat_page.dart';
import 'package:flutter/material.dart';
import 'package:ams_go_mobile/data/data_model.dart';
import 'package:ams_go_mobile/ui/user_details_page.dart';

class AdapterSuratMasuk extends StatelessWidget {
  final User user;

  AdapterSuratMasuk({required this.user});

  String userTitle() {
    String title = "";
    if (user.gender == "Male") {
      title = "Mr.";
    } else if (user.gender == "Female") {
      title = "Ms.";
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: user.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            title: Text('${userTitle()} ${user.firstName} ${user.lastName}'),
            subtitle: Text(user.job),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailSuratMasukPage();
              }));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserDetailsPage(user: user)));
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}

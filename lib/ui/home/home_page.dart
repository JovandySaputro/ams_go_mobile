import 'package:ams_go_mobile/components/appBarDefault.dart';
import 'package:ams_go_mobile/data/sharedpref/sharedpref.dart';
import 'package:ams_go_mobile/ui/List_Page.dart';
import 'package:ams_go_mobile/ui/create_page.dart';
import 'package:ams_go_mobile/ui/profile_page.dart';
import 'package:ams_go_mobile/ui/suratMasuk/list/list_surat_masuk.dart';
import 'package:ams_go_mobile/widget/navbar.dart';
import 'package:ams_go_mobile/widget/navigation_drawer_widget2.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_sidebar/flutter_sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _launchURL() async {
    const url = 'https://africau.edu/images/default/sample.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBarDefault("Home"),
      body: Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffF18265),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // _launchURL();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListSuratMasuk();
              }));
            },
            child: Text(
              "Surat Masuk",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

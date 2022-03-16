import 'package:ams_go_mobile/model/navigation_item.dart';
import 'package:ams_go_mobile/provider/navigation_provider2.dart';
import 'package:ams_go_mobile/ui/create_page.dart';
import 'package:ams_go_mobile/ui/favourites_page.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';
import 'package:ams_go_mobile/ui/login_page.dart';
import 'package:ams_go_mobile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MainHome());
}

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider2(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "",
          // theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider2>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HomePage();
      case NavigationItem.people:
        return HomePage();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.workflow:
        return HomePage();
      case NavigationItem.updates:
        return HomePage();
      case NavigationItem.plugins:
        return HomePage();
      case NavigationItem.notifications:
        return HomePage();
    }
  }
}

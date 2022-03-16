import 'package:ams_go_mobile/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:ams_go_mobile/data/data_model.dart';
import 'package:ams_go_mobile/domain/ApiService.dart';
import 'package:ams_go_mobile/components/loading_widget.dart';
import 'package:ams_go_mobile/components/user_tile.dart';

class ListDelegasi extends StatefulWidget {
  @override
  _ListDelegasiState createState() => _ListDelegasiState();
}

class _ListDelegasiState extends State<ListDelegasi> {
  List<User> _users = <User>[];
  List<User> _usersDisplay = <User>[];
  final ApiService api = ApiService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    api.fetchUsers().then((value) {
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
        print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Delegasi/PLH'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isLoading) {
                return index == 0
                    ? _searchBar()
                    : UserTile(user: this._usersDisplay[index - 1]);
              } else {
                return LoadingView();
              }
            },
            itemCount: _usersDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _usersDisplay = _users.where((u) {
              var fName = u.firstName.toLowerCase();
              var lName = u.lastName.toLowerCase();
              var job = u.job.toLowerCase();
              return fName.contains(searchText) ||
                  lName.contains(searchText) ||
                  job.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Users',
        ),
      ),
    );
  }
}

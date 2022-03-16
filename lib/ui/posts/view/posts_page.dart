import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams_go_mobile/ui/posts/posts.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: Column(
          children: [
            Center(
                child: Text(
              "Riwayat Tindakan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            PostsList(),
          ],
        ),
      ),
    );
  }
}

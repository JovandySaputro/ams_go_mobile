import 'package:ams_go_mobile/ui/suratMasuk/detail/tindakan/tindakan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

class TindakanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            TindakanBloc(httpClient: http.Client())..add(TindakanFetched()),
        child: TindakanList(),
      ),
    );
  }
}

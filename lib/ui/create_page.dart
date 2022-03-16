import 'package:ams_go_mobile/components/loading_widget.dart';
import 'package:ams_go_mobile/data/get_api.dart';
import 'package:ams_go_mobile/data/get_list_api.dart';
import 'package:ams_go_mobile/data/post_api.dart';
import 'package:ams_go_mobile/domain/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final ApiService api = ApiService();
  Post_API? post_api = null;
  Get_Api? get_api = null;
  Get_List_Api? get_list_api = null;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingView()
        : Scaffold(
            appBar: AppBar(
              title: Text("Create API"),
            ),
            body: SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (get_list_api != null) ...[
                    Text(get_list_api!.data![1].firstName.toString())
                  ] else ...[
                    Text("no data")
                  ],
                  RaisedButton(
                    child: Text("GET"),
                    onPressed: () {
                      setState(() {
                        EasyLoading.show(status: "Loading");
                      });
                      api.fetchGetListApi("2").then((value) {
                        get_list_api = value;
                        setState(() {
                          EasyLoading.showSuccess("sukses");
                          EasyLoading.dismiss();
                        });
                        // setState(() => loading = true);
                        // api.fetchGetListApi("2").then((value) {
                        //   get_list_api = value;
                        //   setState(() {
                        //     loading = false;
                        //   });
                      }, onError: (error) {
                        EasyLoading.showError(error);
                        EasyLoading.dismiss();
                      });
                    },
                  )
                ],
              )),
            ),
          );
  }
}

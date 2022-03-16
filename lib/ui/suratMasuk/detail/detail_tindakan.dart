import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class DetailTindakan extends StatelessWidget {
  const DetailTindakan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailTindakanPage(),
    );
  }
}

class DetailTindakanPage extends StatefulWidget {
  const DetailTindakanPage({Key? key}) : super(key: key);

  @override
  State<DetailTindakanPage> createState() => _DetailTindakanPageState();
}

class _DetailTindakanPageState extends State<DetailTindakanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(
          "Riwayat Tindakan",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Text(index.toString());
                }))
      ]),
    );
  }
}

class TindakanBloc extends Bloc<int, List<ItemTindakan>> {
  TindakanBloc(List<ItemTindakan> initialState) : super(initialState);
  @override
  void onChange(Change<List<ItemTindakan>> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}

class ItemTindakan {
  String? imageUrl;
  String? nama;
  String? jabatan;
  ItemTindakan({this.imageUrl, this.nama, this.jabatan});
}

import 'package:ams_go_mobile/components/appBarDefault.dart';
import 'package:ams_go_mobile/ui/posts/posts.dart';
import 'package:ams_go_mobile/ui/suratMasuk/detail/detail_lampiran.dart';
import 'package:ams_go_mobile/ui/suratMasuk/detail/surat_masuk_preview.dart';
import 'package:ams_go_mobile/ui/suratMasuk/detail/tindakan/tindakan.dart';
import 'package:flutter/material.dart';
import 'package:ams_go_mobile/data/data_model.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSuratMasukPage extends StatefulWidget {
  const DetailSuratMasukPage({Key? key}) : super(key: key);

  @override
  State<DetailSuratMasukPage> createState() => _DetailSuratMasukPageState();
}

class _DetailSuratMasukPageState extends State<DetailSuratMasukPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault("Detail Surat Masuk"),
      body: Container(
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              margin: EdgeInsets.all(10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Isi Surat',
                  ),
                  Tab(
                    text: 'Lampiran',
                  ),
                  Tab(
                    text: 'Tindakan',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 30),
                    child: PDFViewerFromUrl(
                      url: 'http://africau.edu/images/default/sample.pdf',
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 60),
                      child: DetailLampiranPage()),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 60),
                      child: TindakanPage()),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        bottomButton("Disposisi", Icons.account_tree),
                        Container(
                          width: 2,
                          color: Colors.black,
                        ),
                        bottomButton("Teruskan", Icons.forward_to_inbox)
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Flexible bottomButton(String title, IconData icon) {
    return Flexible(
        flex: 1,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              )
            ]),
          ),
        ));
  }
}

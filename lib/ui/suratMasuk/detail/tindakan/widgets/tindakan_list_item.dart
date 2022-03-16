import 'package:flutter/material.dart';
import 'package:ams_go_mobile/ui/suratMasuk/detail/tindakan/tindakan.dart';

class TindakanListItem extends StatelessWidget {
  const TindakanListItem({Key? key, required this.tindakan}) : super(key: key);

  final Tindakan tindakan;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${tindakan.id}', style: textTheme.caption),
        title: Text(tindakan.title),
        isThreeLine: true,
        subtitle: Text(tindakan.body),
        dense: true,
      ),
    );
  }
}

import 'package:ams_go_mobile/ui/suratMasuk/detail/tindakan/tindakan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TindakanList extends StatefulWidget {
  @override
  _TindakanListState createState() => _TindakanListState();
}

class _TindakanListState extends State<TindakanList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TindakanBloc, TindakanState>(
      builder: (context, state) {
        switch (state.status) {
          case TindakanStatus.failure:
            return const Center(child: Text('failed to fetch Tindakan'));
          case TindakanStatus.success:
            if (state.tindakan.isEmpty) {
              return const Center(child: Text('no Tindakan'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Riwayat Tindakan",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(""),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.tindakan.length
                          ? BottomLoader()
                          : TindakanListItem(tindakan: state.tindakan[index]);
                    },
                    itemCount: state.hasReachedMax
                        ? state.tindakan.length
                        : state.tindakan.length + 1,
                    controller: _scrollController,
                  ),
                ),
              ],
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<TindakanBloc>().add(TindakanFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

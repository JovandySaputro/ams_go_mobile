import 'dart:async';
import 'dart:convert';

import 'package:ams_go_mobile/ui/suratMasuk/detail/tindakan/tindakan.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'tindakan_event.dart';
part 'tindakan_state.dart';

const _tindakanLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TindakanBloc extends Bloc<TindakanEvent, TindakanState> {
  TindakanBloc({required this.httpClient}) : super(const TindakanState()) {
    on<TindakanFetched>(
      _onTindakanFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onTindakanFetched(
    TindakanFetched event,
    Emitter<TindakanState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TindakanStatus.initial) {
        final tindakan = await _fetchtindakan();
        return emit(state.copyWith(
          status: TindakanStatus.success,
          tindakan: tindakan,
          hasReachedMax: false,
        ));
      }
      final tindakan = await _fetchtindakan(state.tindakan.length);
      tindakan.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: TindakanStatus.success,
                tindakan: List.of(state.tindakan)..addAll(tindakan),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: TindakanStatus.failure));
    }
  }

  Future<List<Tindakan>> _fetchtindakan([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_tindakanLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Tindakan(
          id: json['id'] as int,
          title: json['title'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching tindakan');
  }
}

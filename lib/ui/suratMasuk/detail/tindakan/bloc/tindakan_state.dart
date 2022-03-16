part of 'tindakan_bloc.dart';

enum TindakanStatus { initial, success, failure }

class TindakanState extends Equatable {
  const TindakanState({
    this.status = TindakanStatus.initial,
    this.tindakan = const <Tindakan>[],
    this.hasReachedMax = false,
  });

  final TindakanStatus status;
  final List<Tindakan> tindakan;
  final bool hasReachedMax;

  TindakanState copyWith({
    TindakanStatus? status,
    List<Tindakan>? tindakan,
    bool? hasReachedMax,
  }) {
    return TindakanState(
      status: status ?? this.status,
      tindakan: tindakan ?? this.tindakan,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''TindakanState { status: $status, hasReachedMax: $hasReachedMax, tindakan: ${tindakan.length} }''';
  }

  @override
  List<Object> get props => [status, tindakan, hasReachedMax];
}

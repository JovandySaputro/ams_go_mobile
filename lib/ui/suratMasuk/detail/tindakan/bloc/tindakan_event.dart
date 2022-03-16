part of 'tindakan_bloc.dart';

abstract class TindakanEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TindakanFetched extends TindakanEvent {}

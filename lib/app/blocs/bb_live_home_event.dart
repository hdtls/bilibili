part of 'bb_live_home_bloc.dart';

@immutable
abstract class LiveHomeEvent extends Equatable {}

class LiveHomeLoadEvent extends LiveHomeEvent {

  final String path;
  final int page;
  final int pageSize;

  LiveHomeLoadEvent({this.path = "", this.page = 1, this.pageSize = 20});

  @override
  List<Object> get props => [path, page, pageSize];
}
part of 'bb_bangumi_home_bloc.dart';

@immutable
abstract class BangumiHomeEvent extends Equatable {}

class BangumiHomePaginationLoadEvent extends BangumiHomeEvent {
  final String path;
  final int page;
  final int pageSize;

  BangumiHomePaginationLoadEvent({this.path = "", this.page = 1, this.pageSize = 20});

  @override
  List<Object> get props => [path, page, pageSize];
}

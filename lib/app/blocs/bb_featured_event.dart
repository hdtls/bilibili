part of 'bb_featured_bloc.dart';

@immutable
abstract class FeaturedEvent extends Equatable {}

class FeaturedLoadEvent extends FeaturedEvent {

  final String path;
  final int page;
  final int pageSize;

  FeaturedLoadEvent({this.path = "", this.page = 1, this.pageSize = 20});

  @override
  List<Object> get props => [path, page, pageSize];
}
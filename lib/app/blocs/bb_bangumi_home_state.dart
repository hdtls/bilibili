part of 'bb_bangumi_home_bloc.dart';

@immutable
abstract class BangumiHomeState extends Equatable {
  const BangumiHomeState();
}

class BangumiHomeLoading extends BangumiHomeState {
  @override
  List<Object> get props => [];
}

class BangumiHomeLoadSuccess<Value> extends BangumiHomeState {
  final Value value;
  BangumiHomeLoadSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class BangumiHomeLoadFailure extends BangumiHomeState {
  final String description;
  BangumiHomeLoadFailure(this.description);

  @override
  List<Object> get props => [description];
}

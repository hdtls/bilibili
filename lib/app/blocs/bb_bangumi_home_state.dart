part of 'bb_bangumi_home_bloc.dart';

@immutable
abstract class BangumiHomeState extends Equatable {
  const BangumiHomeState();
}

class BangumiHomeLoading extends BangumiHomeState {
  @override
  List<Object> get props => [];
}

class BangumiHomeLoadSuccess<Value extends Object> extends BangumiHomeState {
  final Value value;
  const BangumiHomeLoadSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class BangumiHomeLoadFailure extends BangumiHomeState {
  final String description;
  const BangumiHomeLoadFailure(this.description);

  @override
  List<Object> get props => [description];
}

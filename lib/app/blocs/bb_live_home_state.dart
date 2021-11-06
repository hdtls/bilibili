part of 'bb_live_home_bloc.dart';

@immutable
abstract class LiveHomeState extends Equatable {
  const LiveHomeState();
}

class LiveHomeLoading extends LiveHomeState {
  @override
  List<Object> get props => [];
}

class LiveHomeLoadSuccess<Value> extends LiveHomeState {
  final Value value;
  LiveHomeLoadSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class LiveHomeLoadFailure extends LiveHomeState {
  final String description;
  LiveHomeLoadFailure(this.description);

  @override
  List<Object> get props => [description];
}

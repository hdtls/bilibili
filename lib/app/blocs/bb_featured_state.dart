part of 'bb_featured_bloc.dart';

@immutable
abstract class FeaturedState extends Equatable {
  const FeaturedState();
}

class FeaturedLoading extends FeaturedState {
  @override
  List<Object> get props => [];
}

class FeaturedLoadSuccess<Value extends Object> extends FeaturedState {
  final Value value;
  const FeaturedLoadSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class FeaturedLoadFailure extends FeaturedState {
  final String description;
  const FeaturedLoadFailure(this.description);

  @override
  List<Object> get props => [description];
}

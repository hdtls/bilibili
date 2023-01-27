import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/bb_api.dart';

part 'bb_featured_event.dart';
part 'bb_featured_state.dart';

class BBFeaturedBLoC extends Bloc<FeaturedEvent, FeaturedState> {

  BBFeaturedBLoC(): super(FeaturedLoading()) {
    on<FeaturedLoadEvent>(performLoading);
  }

  void performLoading(FeaturedEvent event, Emitter<FeaturedState> emit) async {
    emit(FeaturedLoading());
    try {
        HttpBody<FeaturedBody> body = await BBApi.requestAllFeatured();

        emit(FeaturedLoadSuccess(body.data?.items?.toList() ?? []));
      } catch (e) {
        emit(FeaturedLoadFailure(e.toString()));
      }
  }
}

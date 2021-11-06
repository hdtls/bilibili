import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../api/bb_api.dart';

part 'bb_bangumi_home_event.dart';
part 'bb_bangumi_home_state.dart';

class BBBangumiHomeBLoC extends Bloc<BangumiHomeEvent, BangumiHomeState> {

  BBBangumiHomeBLoC(): super(BangumiHomeLoading()) {
    on<BangumiHomePaginationLoadEvent>(performLoading);
  }

  void performLoading(BangumiHomePaginationLoadEvent event, Emitter<BangumiHomeState> emit) async {
    emit(BangumiHomeLoading());
      try {
        HttpBody<BangumiHomeBody> httpBody =
            await BBApi.requestAllBangumi(event.path);
            emit(BangumiHomeLoadSuccess(httpBody.result?.modules?.toList() ?? []));
      } catch (e) {
        emit(BangumiHomeLoadFailure(e.toString()));
      }
  }
}

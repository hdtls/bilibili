import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../api/bb_api.dart';

part 'bb_live_home_event.dart';
part 'bb_live_home_state.dart';

class BBLiveHomeBLoC extends Bloc<LiveHomeEvent, LiveHomeState> {

  BBLiveHomeBLoC(): super(LiveHomeLoading()) {
    on<LiveHomeLoadEvent>(performLoading);
  }

  void performLoading(LiveHomeEvent event, Emitter<LiveHomeState> emit) async {
    emit(LiveHomeLoading());
    try {
      HttpBody<LiveHomeBody> body = await BBApi.requestAllLive();
      List<LiveGroup> copy = [];

      copy.addAll(body?.data?.banner ?? []);
      copy.addAll(body?.data?.areaEntranceV2 ?? []);
      copy.addAll(body?.data?.activityCardV2 ?? []);
      copy.addAll(body?.data?.myIdol ?? []);
      copy.addAll(body?.data?.roomList ?? []);
      copy.addAll(body?.data?.hourRank ?? []);

      copy = copy.where((e) => e.list?.isNotEmpty ?? false).toList();
      copy.sort((lhs, rhs) => lhs.module.sort.compareTo(rhs.module.sort));

      emit(LiveHomeLoadSuccess(copy));
    } catch (e) {
      emit(LiveHomeLoadFailure(e.toString()));
    }
  }
}

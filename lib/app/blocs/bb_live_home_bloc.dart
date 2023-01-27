import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      copy.addAll(body.data?.banner?.toList() ?? []);
      copy.addAll(body.data?.areaEntranceV2?.toList() ?? []);
      copy.addAll(body.data?.activityCardV2?.toList() ?? []);
      copy.addAll(body.data?.myIdol?.toList() ?? []);
      copy.addAll(body.data?.roomList?.toList() ?? []);
      copy.addAll(body.data?.hourRank?.toList() ?? []);

      copy = copy.where((e) => e.list?.isNotEmpty ?? false).toList();
      copy.sort((lhs, rhs) => lhs.module?.sort?.compareTo(rhs.module?.sort ?? 0) ?? 0);

      emit(LiveHomeLoadSuccess(copy));
    } catch (e) {
      emit(LiveHomeLoadFailure(e.toString()));
    }
  }
}

import 'package:fluro/fluro.dart';

import 'bb_route_handlers.dart';

export 'package:fluro/fluro.dart';

class BBRouteMgr {
  static String root = "/";
  static String home = "bilibili://main/home/";
  static String liveHome = "bilibili://live/home";
  static String featured = "bilibili://pegasus/promo";
  static String popular = "bilibili://pegasus/hottopic";
  static String pgc = "bilibili://pgc/";
  static String gameCenter = "bilibili://game_center/home";
  static String message = "bilibili://link/home/im_home";
  static String timeline = "bilibili://following/home/";
  static String shopping = "bilibili://mall/home/";
  static String mine = "bilibili://user_center/";
  static String channel = "bilibili://pegasus/channel/";
  static String partations = "bilibili://partations";
  static String channels = "bilibili://channels";
  static String video = "bilibili://video/";

  static setup() {
    FluroRouter.appRouter.notFoundHandler = notFoundHandler;
    FluroRouter.appRouter.define(root, handler: rootHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define("$pgc:path", handler: pgcHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(home, handler: homeHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(liveHome, handler: liveHomeHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(featured, handler: featuredHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(popular, handler: popularHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(channel, handler: channelContainerHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(partations, handler: partationsHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(channels, handler: channelsHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define(mine, handler: mineHandler, transitionType: TransitionType.cupertino);
    FluroRouter.appRouter.define("$video:id", handler: videoHandler, transitionType: TransitionType.cupertino);
  }
}

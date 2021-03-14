import 'package:dartmazing/Pages/Feed/cubit/feed_cubit.dart';
import 'package:dartmazing/Pages/Feed/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const Feed = "/";
  static const Repositories = "/repositories";
  static const Detail = "/detail";
}

class RouterManager {

  static Map<String, WidgetBuilder> routes() {
    Map<String, WidgetBuilder> routes = {};
    routes.addAll(_applicationRoutes());
    return routes;
  }

  static Map<String, WidgetBuilder> _applicationRoutes() => {
    Routes.Feed: (context) {
      return BlocProvider<FeedCubit>(
        create: (context) => FeedCubit(
        ),
        child: FeedPage(),
      );
    },
  }; 

}
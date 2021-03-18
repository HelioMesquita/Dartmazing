import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Network/worker.dart';
import 'package:dartmazing/Scenes/Detail/Page/cubit/detail_cubit.dart';
import 'package:dartmazing/Scenes/Detail/Page/detail_page.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:dartmazing/Scenes/Feed/Page/cubit/feed_cubit.dart';
import 'package:dartmazing/Scenes/Feed/Page/feed_page.dart';
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
          interactor: FeedInteractor(worker: Worker())
        ),
        child: FeedPage(),
      );
    },

    Routes.Detail: (context) {
      final args = ModalRoute.of(context).settings.arguments as Repository;
      return BlocProvider<DetailCubit>(
        create: (context) => DetailCubit(
          repository: args
        ),
        child: DetailPage(),
      );
    },
  };

}
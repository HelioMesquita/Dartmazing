import 'package:dartmazing/Components/FeedNewsSection/feed_news_section.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Routes/routes.dart';
import 'package:dartmazing/Scenes/Feed/Page/cubit/feed_cubit.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedCubit, FeedState>(
      listener: (context, state) {
        if (state is PresentRepositoriesList) {
          Navigator.of(context).pushNamed(Routes.RepositoriesList, arguments: state.transferObject);
        }
      },
      builder: (context, state) {
        if (state is Loading) return _baseScreen(context: context, body: () => _loading());
        if (state is Loaded) return _baseScreen(context: context, body: () => _feed(state, context));
        if (state is Error) return _baseScreen(context: context, body: () => _error(context));
        return Container();
      }
    );
  }

  Widget _baseScreen({BuildContext context, Widget Function() body}) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              border: Border.all(color: Colors.transparent),
              backgroundColor: Theme.of(context).backgroundColor,
              largeTitle: Text(
                S.of(context).aplicationName,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                  letterSpacing: -1
                ),
              ),
            ),
          ];
        },
        body: body(),
      ),
    );
  }

  Widget _pullToRefresh(BuildContext context, SliverList body) {
    final cubit = BlocProvider.of<FeedCubit>(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () => cubit.getRepositories()
        ),
        body
      ]
    );
  }

  // Loading State
  Widget _loading() => Center(child: CupertinoActivityIndicator(animating: true));

  // Error State
  Widget _error(BuildContext context) {
    return _pullToRefresh(context, _errorSliver(context));
  }
  
  SliverList _errorSliver(BuildContext context) {
    final items = [
      Text(
        S.of(context).anErrorHappened,
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Theme.of(context).textTheme.button.color,
          fontSize: 24,
          letterSpacing: -0.3
        ),
        
      ),
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => items[index],
        childCount: items.length,
      )
    );
  }

  // Loaded State
  Widget _feed(Loaded state, BuildContext context) {
    return _pullToRefresh(context, _feedSliverList(state, context));
  }

  SliverList _feedSliverList(Loaded state, BuildContext context) {
    final cubit = BlocProvider.of<FeedCubit>(context);
    final items = [
      FeedNewsSection(
        section: state.viewModel.newsSection, 
        seeMoreTap: (type) => cubit.seeMore(type)
      ),
      FeedRepositoriesSection(
        viewModel: state.viewModel.starsSection,
        seeMoreTap: (type) => cubit.seeMore(type),
        repositoryTap: (repository) => _presentDetail(repository, context)
      ),
      FeedRepositoriesSection(
        viewModel: state.viewModel.updatedSection, 
        seeMoreTap: (type) => cubit.seeMore(type),
        repositoryTap: (repository) => _presentDetail(repository, context)
      )
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => items[index],
        childCount: items.length,
      )
    );
  }

  _presentDetail(Repository repository, BuildContext context) {
    Navigator.of(context).pushNamed(Routes.Detail, arguments: repository);
  }

}


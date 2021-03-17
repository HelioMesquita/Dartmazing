import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section.dart';
import 'package:dartmazing/Scenes/Feed/Page/cubit/feed_cubit.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FeedCubit, FeedState>(
        builder: (context, state) {
          // final cubit = BlocProvider.of<FeedCubit>(context);

          if (state is Loading) {
            return _baseScreen(body: () => _loading(), context: context);
          }

          if (state is Loaded) {
            return _baseScreen(body: () => _list(state), context: context);
          }

          if (state is Error) {

          }

          return Container();
        }
    );
  }

  Widget _baseScreen({Widget Function() body, BuildContext context}) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: Theme.of(context).backgroundColor,
              largeTitle: Text(
                S.of(context).aplicationName,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color
                ),
              ),
            )
          ];
        },
        body: body(),
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: CupertinoActivityIndicator(animating: true)
    );
  }

  Widget _list(Loaded state) {
    return Column(
      children: [
        FeedRepositoriesSection(section: state.viewModel.starsSection),
        // FeedRepositoriesSection(section: state.viewModel.updatedSection)
      ]
    );
  }

}


import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group_view_model.dart';
import 'package:dartmazing/Components/FeedRepositoryCell/feed_repository_cell.dart';
import 'package:flutter/material.dart';

class FeedRepositoriesGroup extends StatelessWidget {

  final FeedRepositoriesGroupViewModel group;

  const FeedRepositoriesGroup({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeedRepositoryCell(repository: group.firstCell),
        Visibility(
          visible: group.secondCell != null,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 86.0, right: 12.0),
                child: Divider(color: Theme.of(context).shadowColor, thickness: 0.5,),
              ),
              FeedRepositoryCell(repository: group.secondCell)
            ],
          ),
        ),

        Visibility(
          visible: group.thirdCell != null,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 86.0, right: 12.0),
                child: Divider(color: Theme.of(context).shadowColor, thickness: 0.5,),
              ),
              FeedRepositoryCell(repository: group.thirdCell)
            ],
          ),
        )
      ],
    );
  }

}
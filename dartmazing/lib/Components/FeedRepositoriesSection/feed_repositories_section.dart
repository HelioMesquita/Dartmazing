import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section_view_model.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeedRepositoriesSection extends StatelessWidget {
  final FeedRepositoriesSectionViewModel viewModel;
  final Function(RepositoriesType) seeMoreTap;
  final Function(Repository) repositoryTap;
  final padding = EdgeInsets.only(left: 16.0, right: 12.0);

  FeedRepositoriesSection({
    Key? key,
    required this.viewModel,
    required this.seeMoreTap,
    required this.repositoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_topDivider(context), _header(context), _carousel()],
    );
  }

  Widget _topDivider(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: Theme.of(context).shadowColor,
        thickness: 0.5,
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getFilterTitle(viewModel.type),
            style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3),
          ),
          TextButton(
              child: Text(
                S.of(context).seeMore,
                style: TextStyle(
                    color: Theme.of(context).textTheme.button!.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.3),
              ),
              onPressed: () => seeMoreTap(viewModel.type))
        ],
      ),
    );
  }

  Widget _carousel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 270,
        viewportFraction: 0.92,
        enableInfiniteScroll: false,
      ),
      itemCount: viewModel.numberOfRows,
      itemBuilder: (context, index, _) {
        return Container(
            margin: EdgeInsets.only(right: 12),
            child: FeedRepositoriesGroup(
                group: viewModel.groupForIndex(index),
                repositoryTap: repositoryTap));
      },
    );
  }
}

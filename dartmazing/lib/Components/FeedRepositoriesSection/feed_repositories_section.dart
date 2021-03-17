import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section_view_model.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeedRepositoriesSection extends StatelessWidget {

  final FeedRepositoriesSectionViewModel section;

  const FeedRepositoriesSection({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Divider(color: Theme.of(context).shadowColor, thickness: 0.5,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).topRepos,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                S.of(context).seeMore,
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                  fontSize: 18,
                ),
              ),
            ]
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 0.92,
              initialPage: 0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: section.numberOfRows,
            itemBuilder: (context,index,_) {
              return Container(
                margin: EdgeInsets.only(right: 12),
                child: FeedRepositoriesGroup(group: section.groupForIndex(index))
              );
            },
          ),
        ),
      ],
    );
  }

}
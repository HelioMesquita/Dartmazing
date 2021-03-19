import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartmazing/Components/FeedNewsCell/feed_news_cell.dart';
import 'package:dartmazing/Components/FeedNewsSection/feed_news_section_view_model.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_type.dart';
import 'package:flutter/material.dart';

class FeedNewsSection extends StatelessWidget {

  final FeedNewsSectionViewModel section;
  final Function(RepositoriesType) seeMoreTap;

  FeedNewsSection({Key key, this.section, this.seeMoreTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 360,
        viewportFraction: 0.92,
        enableInfiniteScroll: false,
      ),
      itemCount: section.toList.length,
      itemBuilder: (context,index,_) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 12),
            child: FeedNewsCell(viewModel: section.toList[index])
          ),
          onTap: () => seeMoreTap(section.toList[index].type)
        );
      },
    );
  }

}
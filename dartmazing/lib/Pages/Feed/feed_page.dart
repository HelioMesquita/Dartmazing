import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
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
        body: Column(children: [
          feedRepositoryCell(FeedRepositoryCellViewModel(author: "Helio", name: "Flutter", stars: "100k", imageURL: "https://avatars3.githubusercontent.com/u/25267226?s=400&v=4"), context)
        ],),
      ),
    );
  }

  Widget feedRepositoryCell(FeedRepositoryCellViewModel viewModel, BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).shadowColor
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  viewModel.imageURL,
                  width: 62.0,
                  height: 62.0,
                )
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,                
                children: [
                  Text(
                    viewModel.name,
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline6.color,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    viewModel.author,
                    maxLines: 2,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2.color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 28,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).shadowColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      viewModel.stars,
                      style: TextStyle(
                        backgroundColor: Theme.of(context).shadowColor,
                        color: Theme.of(context).textTheme.button.color,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  S.of(context).stars,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2.color,
                    fontSize: 11,
                  ),
                ),
              ]
            )
          ]
        ),
      ),
    );
  }

}

class FeedRepositoryCellViewModel {
  final String name;
  final String author;
  final String stars;
  final String imageURL;

  FeedRepositoryCellViewModel({this.name, this.author, this.stars, this.imageURL});
}
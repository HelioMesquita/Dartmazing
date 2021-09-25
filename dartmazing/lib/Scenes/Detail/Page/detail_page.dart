import 'package:dartmazing/Scenes/Detail/Models/detail_view_model.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/detail_cubit.dart';

class DetailPage extends StatelessWidget {
  final borderRadius = BorderRadius.circular(20);

  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
      final viewModel = state.viewModel;
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 24, right: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _header(context, viewModel),
            SizedBox(height: 2),
            Divider(color: Theme.of(context).shadowColor, thickness: 0.5),
            _text(context, viewModel.description),
            SizedBox(height: 10),
            _text(context, viewModel.stars),
            SizedBox(height: 8),
            _text(context, viewModel.issues),
            SizedBox(height: 8),
            _text(context, viewModel.forks),
            SizedBox(height: 8),
            _text(context, viewModel.lastUpdate),
          ]),
        ),
      );
    });
  }

  Widget _text(BuildContext context, String? text) {
    return Visibility(
      visible: text != null,
      child: Text(
        text ?? "",
        maxLines: 2,
        style: TextStyle(
          color: Theme.of(context).textTheme.subtitle2!.color,
          fontSize: 16,
          letterSpacing: -0.3,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _header(BuildContext context, DetailViewModel viewModel) {
    return Row(children: [
      _image(context, viewModel),
      SizedBox(width: 12),
      _headerText(context, viewModel)
    ]);
  }

  Widget _image(BuildContext context, DetailViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(width: 1, color: Theme.of(context).shadowColor),
      ),
      child: ClipRRect(
          borderRadius: borderRadius,
          child: Image.network(
            viewModel.imageURL,
            width: 115,
            height: 115,
          )),
    );
  }

  Widget _headerText(BuildContext context, DetailViewModel viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        viewModel.name,
        style: TextStyle(
            color: Theme.of(context).textTheme.headline6!.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3),
      ),
      Text(
        viewModel.author,
        maxLines: 2,
        style: TextStyle(
            color: Theme.of(context).textTheme.subtitle2!.color,
            fontSize: 16,
            letterSpacing: -0.3),
      ),
      SizedBox(height: 45),
      Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          S.of(context).seeRepository,
          style: TextStyle(
              backgroundColor: Theme.of(context).shadowColor,
              color: Theme.of(context).textTheme.button!.color,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3),
        ),
      ),
    ]);
  }
}

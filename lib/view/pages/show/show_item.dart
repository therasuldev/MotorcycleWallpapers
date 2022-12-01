import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:motorcycle/constant/app_colors.dart';
import 'package:motorcycle/core/bloc/app/wallpapers_bloc.dart';
import 'package:motorcycle/core/model/wallpapers.dart';
import 'package:motorcycle/view/utils.dart';
import 'package:motorcycle/view/widgets/fade_animation.dart';
import 'package:motorcycle/view/widgets/route.dart';

import '../../../core/bloc/preferences/favorite_bloc.dart';

class ShowWallpapers extends StatefulWidget {
  final String name;
  final String url;
  const ShowWallpapers({Key? key, required this.name, required this.url})
      : super(key: key);

  @override
  State<ShowWallpapers> createState() => _ShowWallpapersState();
}

class _ShowWallpapersState extends State<ShowWallpapers> {
  void _saveNetworkImage(url) async {
    String path = url;
    await GallerySaver.saveImage(path);
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            FadeAnimation(delay: .5, child: _generalItem()),
            FadeAnimation(delay: 1, child: _nameOfItem()),
            const SizedBox(height: 10),
            FadeAnimation(delay: 1, child: _buttons(context)),
            ViewUtils.divider(),
            BlocBuilder<WallpapersBloc, WallpapersState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is Loaded) {
                  final wallpapers = state.wallpapers;
                  return FadeAnimation(
                    delay: 1.5,
                    child: GridView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 2 / 3,
                              mainAxisSpacing: 15),
                      itemCount: wallpapers.length,
                      itemBuilder: (context, index) {
                        final getWallp = state.wallpapers[index];
                        return GestureDetector(
                          onTap: () => AppRoute.go(
                            context,
                            ShowWallpapers(
                                name: getWallp.name, url: getWallp.url),
                          ),
                          child: _getMoreItems(context, wallpapers, index),
                        );
                      },
                    ),
                  );
                }
                if (state is Error) return Center(child: Text(state.message));
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _getMoreItems(
      BuildContext context, List<Wallpapers> wallpapers, int index) {
    final getWallp = wallpapers[index];
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: ViewUtils.decoration(color: AppColors.grey, radius: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: ViewUtils.size(context).height * .25,
            width: double.infinity,
            decoration: ViewUtils.allDecor(
                radius: 15, color: AppColors.backgC, url: getWallp.url),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                getWallp.name,
                style: ViewUtils.textStyle(
                    fontSize: 18, fWeight: 8, color: AppColors.maxRed),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.download, color: AppColors.black),
                      onPressed: () async {
                        _saveNetworkImage(getWallp.url);
                      }),
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: AppColors.maxRed),
                    onPressed: () => context.read<FavoriteBloc>().add(
                          AddEvent(key: getWallp.name, value: getWallp.url),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
            color: AppColors.materialButton1,
            onPressed: () => _saveNetworkImage(widget.url),
            child: Icon(Icons.download, color: AppColors.grey)),
        MaterialButton(
            color: AppColors.materialButton2,
            onPressed: () => context
                .read<FavoriteBloc>()
                .add(AddEvent(key: widget.name, value: widget.url)),
            child: Icon(Icons.favorite_border, color: AppColors.maxRed)),
      ],
    );
  }

  Text _nameOfItem() {
    return Text(
      widget.name,
      style: ViewUtils.textStyle(fontSize: 20, fWeight: 5),
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }

  Container _generalItem() {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ViewUtils.allDecor(color: AppColors.white, url: widget.url),
    );
  }
}

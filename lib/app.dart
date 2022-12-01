// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:motorcycle/constant/app_colors.dart';
import 'package:motorcycle/core/bloc/preferences/favorite_bloc.dart';
import 'package:motorcycle/core/bloc/theme/theme_cubit.dart';
import 'package:motorcycle/core/model/wallpapers.dart';
import 'package:motorcycle/core/repository/hive/preferences.dart';
import 'package:motorcycle/core/repository/repository.dart';
import 'package:motorcycle/home_build.dart';
import 'package:motorcycle/view/pages/favorite/favorites.dart';
import 'package:motorcycle/view/pages/settings.dart';
import 'package:motorcycle/view/pages/show/show_item.dart';
import 'package:motorcycle/view/utils.dart';
import 'package:motorcycle/view/widgets/route.dart';
import 'package:provider/provider.dart';

import 'core/bloc/app/wallpapers_bloc.dart';
import 'core/bloc/network/network_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(ListenConnection())),
        BlocProvider<WallpapersBloc>(
            create: (context) =>
                WallpapersBloc(wallpapersRepository: WallpapersRepository())),
        BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(hiveDB: HiveDB())),
        BlocProvider<ThemeCubit>(create: (coontext) => ThemeCubit()..initApp())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            home: HomeBuild.build(),
          );
        },
      ),
    );
  }
}

class MotorcycleApp extends StatefulWidget {
  const MotorcycleApp({Key? key}) : super(key: key);

  @override
  State<MotorcycleApp> createState() => _MotorcycleAppState();
}

class _MotorcycleAppState extends State<MotorcycleApp> {
  final scrollController = ScrollController();
  int isActive = 0;
  bool active = false;
  int page = 1;
  int index = 0;
  Color favoriteIcon = AppColors.black;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WallpapersBloc>(context).add(GetPageEvent(pages: page));
    BlocProvider.of<FavoriteBloc>(context);
  }

  void _saveNetworkImage(url) async {
    String path = url;
    await GallerySaver.saveImage(path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: index == 0
            ? SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: BlocBuilder<WallpapersBloc, WallpapersState>(
                      builder: (context, state) {
                        if (state is Empty) {
                          return const SizedBox.shrink();
                        }
                        if (state is Loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is Loaded) {
                          final wallpapers = state.wallpapers;
                          return _allBodyComponents(wallpapers);
                        }
                        if (state is Error) {
                          return Center(child: Text(state.message));
                        }
                        return const SizedBox.shrink();
                      },
                    )),
              )
            : const Settings(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          onTap: (currentIndex) => setState(() => index = currentIndex),
        ),
      ),
    );
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Motorcycle Wallpapers',
              style: ViewUtils.textStyle(
                fontSize: 20,
                fStyle: 1,
                fWeight: 4,
              ),
            ),
            IconButton(
                onPressed: () => AppRoute.go(context, const Favorites()),
                icon: Icon(Icons.favorite_border, color: AppColors.red))
          ],
        ),
      ),
    );
  }

  Widget _allBodyComponents(List<Wallpapers> wallpapers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 7),
        SizedBox(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 68, // wallpapers.length,
              itemExtent: 35,
              shrinkWrap: true,
              itemBuilder: (context, index) => _allPages(index, context)),
        ),
        const SizedBox(height: 30),
        GridView.builder(
          controller: scrollController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 15,
          ),
          itemCount: wallpapers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => AppRoute.go(
                context,
                ShowWallpapers(
                  name: wallpapers[index].name,
                  url: wallpapers[index].url,
                ),
              ),
              child: _allGridViewComponents(context, wallpapers, index),
            );
          },
        ),
      ],
    );
  }

  Widget _allGridViewComponents(
    BuildContext context,
    List<Wallpapers> wallpapers,
    int index,
  ) {
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
                radius: 15,
                color: AppColors.backgC,
                url: wallpapers[index].url),
          ),
          _listTileComponents(wallpapers, index, context),
        ],
      ),
    );
  }

  Widget _listTileComponents(
    List<Wallpapers> wallpapers,
    int index,
    BuildContext context,
  ) {
    return Expanded(
      child: ListTile(
        title: Text(
          wallpapers[index].name,
          style: ViewUtils.textStyle(
            color: AppColors.maxRed,
            fontSize: 18,
            fWeight: 8,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.download, color: AppColors.black),
              onPressed: () async => _saveNetworkImage(wallpapers[index].url),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.maxRed),
              onPressed: () => context.read<FavoriteBloc>().add(
                    AddEvent(
                      key: wallpapers[index].name,
                      value: wallpapers[index].url,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _allPages(int index, BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    return GestureDetector(
      onTap: () {
        isActive = index;
        page = index;
        context.read<WallpapersBloc>().add(AppendPageEvent(pages: page));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        alignment: Alignment.center,
        decoration: ViewUtils.borderDecor(
            color: (isActive == index) ? AppColors.red : AppColors.amber),
        child: Text(index.toString()),
      ),
    );
  }
}

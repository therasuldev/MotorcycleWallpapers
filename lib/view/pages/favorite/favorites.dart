import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorcycle/constant/app_colors.dart';
import 'package:motorcycle/core/bloc/preferences/favorite_bloc.dart';
import 'package:motorcycle/core/repository/hive/preferences.dart';
import 'package:motorcycle/view/pages/show/show_item.dart';
import 'package:motorcycle/view/utils.dart';
import 'package:motorcycle/view/widgets/route.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final hiveDB = HiveDB();
  @override
  void initState() {
    BlocProvider.of<FavoriteBloc>(context).add(GetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return _allItems(state, size);
          }
          if (state is ErrorState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _allItems(LoadedState state, Size size) {
    return ListView.builder(
        itemCount: state.values?.length ?? 0,
        itemBuilder: (context, index) {
          var name = state.keys[index];
          var image = state.values[index];
          return GestureDetector(
            onTap: () => AppRoute.go(
              context,
              ShowWallpapers(name: name, url: image),
            ),
            child: _getFavoriteItems(size, image, name, context),
          );
        });
  }

  Widget _getFavoriteItems(Size size, image, name, BuildContext context) {
    return Container(
      height: size.height * .4,
      width: size.width,
      margin: const EdgeInsets.all(7),
      decoration: ViewUtils.decoration(color: AppColors.grey, radius: 15),
      child: Column(
        children: [_imageCard(size, image), _listTileComponents(name, context)],
      ),
    );
  }

  Widget _imageCard(Size size, image) {
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: ViewUtils.allDecor(radius: 15, url: image),
    );
  }

  Expanded _listTileComponents(name, BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          name,
          style: ViewUtils.textStyle(fWeight: 6),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: AppColors.maxRed,
          onPressed: () async {
            context.read<FavoriteBloc>().add(RemoveEvent(key: name));
          },
        ),
      ),
    );
  }
}

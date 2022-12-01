import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:motorcycle/core/domain/constant/wallpapers_craft.dart';

class WallpapersRepository {
  Future<List<Map<String, dynamic>>> getWallpapers(int page) async {
    var response = await http.get(
      WallpapersCraft.pageUrl(page),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      Document document = parser.parse(response.body);
      List<Element> wallpapersElements =
          document.querySelectorAll('.wallpapers__item');

      List<Map<String, dynamic>> wallpapers = [];

      for (var wps in wallpapersElements) {
        Element? name = wps.children[0].children[2];
        Element? url = wps.children[0].children[0].children[0];

        wallpapers.add({
          'name': name.text,
          'url': url.attributes['src'],
        });
      }
      return wallpapers;
    } else {
      throw Exception('error');
    }
  }
}

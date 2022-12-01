class WallpapersCraft {
  static const String wallpapersUrl =
      'https://wallpaperscraft.com/catalog/motorcycles';
  static const String pageQuery = '/page';

  static Uri pageUrl(int page) =>
      Uri.parse(wallpapersUrl + pageQuery + page.toString());
}

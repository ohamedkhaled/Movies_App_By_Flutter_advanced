
import '../../Movies_Modul/Domin/Enities/Genres.dart';
import '../../Tv_Modul/Domin/Enities/Genres.dart';

class Methods {
const Methods();
 static String showFormatRunTime(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  static String showGenres(List<GenresEnities> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }
    return result.substring(0, result.length - 2);
  }
static String showGenres2(List<GenresEntitiesTv> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.type}, ';
  }


  if (result.isEmpty) {
    return result;
  }
  return result.substring(0, result.length - 2);
}
}
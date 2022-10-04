import 'package:movies_app/Movies_Modul/Domin/Enities/Genres.dart';

class GenresModel extends GenresEnities{
  GenresModel({required super.id, required super.name});



factory GenresModel.fromjason( Map<String,dynamic> jason){
  return GenresModel( id: jason["id"], name: jason["name"] );
}
}
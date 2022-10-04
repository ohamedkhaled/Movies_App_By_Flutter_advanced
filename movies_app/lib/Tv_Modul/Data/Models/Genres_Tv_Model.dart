

import 'package:movies_app/Tv_Modul/Domin/Enities/Genres.dart';

class GenresTvModel extends GenresEntitiesTv{

  GenresTvModel({required super.id, required super.type});

factory GenresTvModel.fromjason( Map<String,dynamic> jason){
return GenresTvModel( id: jason["id"], type: jason["name"] );
}

}
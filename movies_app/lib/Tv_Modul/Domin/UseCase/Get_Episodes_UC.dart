
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Episodes_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

class GetEpisodesUc extends UseCaseTv<List<EpisodesEntities>,EpisodesParameters>{

final BaseTvRepository baseTvRepository ;


GetEpisodesUc({ required this.baseTvRepository});

  @override
  Future<Either<List<EpisodesEntities>, Exception>> call(EpisodesParameters parameter) async{
    final result = await baseTvRepository.getEpisodesTv(parameter.id,parameter.seasonNumber);

    print(result);
    return result ;
  }



}

class EpisodesParameters extends Equatable {
  final int id ;
  final int seasonNumber;

 const EpisodesParameters({required this.id, required this.seasonNumber});

  @override
  List<Object?> get props => [id,seasonNumber];

}

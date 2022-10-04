import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Populer_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

class GetPopulerTvUC extends UseCaseTv<List<PopulerTvEntities>,NoPrameters>{

 final BaseTvRepository baseTvRepository ;


 GetPopulerTvUC({required this.baseTvRepository});

  @override
  Future<Either<List<PopulerTvEntities>, Exception>> call(NoPrameters parameter) async {

    final result = await baseTvRepository.getPopulerTv();

    return result;
  }

}
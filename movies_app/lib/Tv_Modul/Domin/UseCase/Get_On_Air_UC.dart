
import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/OnAirEntities.dart';

import '../Repository/Base_Tv_Repository.dart';

class GetOnAirUC extends UseCaseTv<List<OnAirEntities>,NoPrameters>{

  final BaseTvRepository baseTvRepository ;

  GetOnAirUC({required this.baseTvRepository});
  @override
  Future<Either<List<OnAirEntities>, Exception>> call(NoPrameters parameter) async {
      final result=   await baseTvRepository.getOnAir();
      return result ;
}
}
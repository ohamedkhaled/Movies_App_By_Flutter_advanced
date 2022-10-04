
import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Details_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

class GetDetailsTvMoviesUC extends UseCaseTv<DetielsTv,int>{
  final BaseTvRepository baseTvRepository ;


  GetDetailsTvMoviesUC({required this.baseTvRepository});

  @override
  Future<Either<DetielsTv, Exception>> call(int parameter)  async{

    final result =  await baseTvRepository.getDeteilsTv(parameter);

  return result;
  }

}
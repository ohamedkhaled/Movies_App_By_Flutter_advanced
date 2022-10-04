
import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Recommendations_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

class GetRecommendationsTvUC extends UseCaseTv<List<RecommendationsTvEntities>,int>{
  final BaseTvRepository baseTvRepository ;


  GetRecommendationsTvUC({required this.baseTvRepository});

  @override
  Future<Either<List<RecommendationsTvEntities>, Exception>> call(int parameter) async {
    final result = await baseTvRepository.getRecommendationsTv(parameter);
    print(result) ;
    return result ;
  }




}
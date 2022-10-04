import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/TopRate_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

class GetTopRateTvUC extends UseCaseTv<List<TopRateTvEntities>, NoPrameters> {
  final BaseTvRepository baseTvRepository;

  GetTopRateTvUC({required this.baseTvRepository});

  @override
  Future<Either<List<TopRateTvEntities>, Exception>> call(
      NoPrameters parameter) async {
    final result = await baseTvRepository.getTopRateTv();

    return result;
  }
}

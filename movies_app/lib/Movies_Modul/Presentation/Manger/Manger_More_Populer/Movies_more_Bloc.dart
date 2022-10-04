import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import '../../../../Core/Use_Cases/Use_Case_Movies.dart';
import '../../../Domin/UseCases/Get_More_Populer_Movies_UC.dart';
import 'Movies_More_Event.dart';
import 'Movies_More_State.dart';

class MoviesMoreBloc extends Bloc<MoviesMoreEvent,MoviesMoreStates>{

  final GetMorePopulerMoviesUC getMorePopulerMoviesUC ;

  MoviesMoreBloc({required this.getMorePopulerMoviesUC}):super(const MoviesMoreStates() ){

    on<GetMorePopulerMovies>(getMorePopuler);

  }



  FutureOr<void> getMorePopuler(GetMorePopulerMovies event, Emitter<MoviesMoreStates> emit) async {

    final result = await getMorePopulerMoviesUC(const NoPrameters());
      result.fold(
              (l) =>
              emit(state.copyWith(
                  MoviesPopulerMore: l, PopulerMoreState: RequestState.loaded)),
              (r) =>
              emit(state.copyWith(messagePopulerMore: r.toString(),
                  PopulerMoreState: RequestState.error)))
      ;


  }

}
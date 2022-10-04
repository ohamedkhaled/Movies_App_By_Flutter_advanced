import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_More_TopRate_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_More_TopRate/Movies_TopRate_More_States.dart';
import '../../../../Core/Use_Cases/Use_Case_Movies.dart';
import 'Movies_TopRate_More_Event.dart';


class MoviesTopRateMoreBloc extends Bloc<MoviesTopRateMoreEvent,MoviesTopRateMoreStates>{

  final GetMoreTopRateMoviesUC getMoreTopRateMoviesUC ;

  MoviesTopRateMoreBloc({required this.getMoreTopRateMoviesUC}):super(const MoviesTopRateMoreStates() ){


    on<GetMoreTopRateMovies>(getMoreTopRate);
  }




  FutureOr<void> getMoreTopRate(GetMoreTopRateMovies event, Emitter<MoviesTopRateMoreStates> emit) async {

    final result = await getMoreTopRateMoviesUC(const NoPrameters());


      result.fold((l) =>
          emit(state.copyWith(
              TopRateMoreState: RequestState.loaded, MoviesTopRateMore: l)),
              (r) =>
              emit(state.copyWith(TopRateMoreState: RequestState.error,
                  messageTopRateMore: r.toString())));


    print("Stete ${MoviesTopRateMoreStates().TopRateMoreState}");
  }
}
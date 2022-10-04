

import 'package:equatable/equatable.dart';

import '../../../../Core/utils/enums.dart';
import '../../../Domin/Enities/Movies_More_Entities.dart';

class MoviesTopRateMoreStates extends Equatable{

  final String messageTopRateMore ;
  final RequestState  TopRateMoreState;
  final List<MoviesMoreEntities> MoviesTopRateMore;

  const MoviesTopRateMoreStates({
    this.messageTopRateMore ="",
    this.TopRateMoreState=RequestState.loading,
    this.MoviesTopRateMore=const []
  });

  MoviesTopRateMoreStates copyWith({
    List<MoviesMoreEntities>? MoviesTopRateMore,
    RequestState? TopRateMoreState,
    String? messageTopRateMore,
  }) {
    return MoviesTopRateMoreStates(
        MoviesTopRateMore: MoviesTopRateMore??this.MoviesTopRateMore,
        TopRateMoreState: TopRateMoreState??this.TopRateMoreState,
        messageTopRateMore: messageTopRateMore??this.messageTopRateMore
    );
  }


  @override
  List<Object?> get props => [messageTopRateMore,MoviesTopRateMore,TopRateMoreState];

}
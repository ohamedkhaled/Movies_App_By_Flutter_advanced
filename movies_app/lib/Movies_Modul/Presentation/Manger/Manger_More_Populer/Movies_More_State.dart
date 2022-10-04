
import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_More_Entities.dart';

import '../../../../Core/utils/enums.dart';

class MoviesMoreStates extends Equatable{

  final String messagePopulerMore ;
  final RequestState  PopulerMoreState;
  final List<MoviesMoreEntities> MoviesPopulerMore;


 const MoviesMoreStates({
    this.messagePopulerMore="",
    this.PopulerMoreState =RequestState.loading,
    this.MoviesPopulerMore =const [],
  });
  MoviesMoreStates copyWith({
    List<MoviesMoreEntities>? MoviesPopulerMore,
    RequestState? PopulerMoreState,
    String? messagePopulerMore
  }) {
    return MoviesMoreStates(
     MoviesPopulerMore: MoviesPopulerMore??this.MoviesPopulerMore,
      PopulerMoreState: PopulerMoreState??this.PopulerMoreState,
      messagePopulerMore: messagePopulerMore??this.messagePopulerMore,
    );
  }

  @override
  List<Object?> get props => [messagePopulerMore,PopulerMoreState,MoviesPopulerMore];


}
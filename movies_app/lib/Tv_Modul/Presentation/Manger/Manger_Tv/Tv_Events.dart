import 'package:equatable/equatable.dart';

abstract class TvEvents extends Equatable {

  const TvEvents();

  @override
  List<Object?> get props =>[];
}

class GetTvEvents extends TvEvents{}
class GetPopulerEvents extends TvEvents{}
  class GetTopRateEvents extends TvEvents{}



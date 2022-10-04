import 'package:equatable/equatable.dart';

abstract class MovieEvents extends Equatable {

const MovieEvents();

@override
  List<Object?> get props =>[];
}

class GetPlayingNowEvent extends MovieEvents {}
class GetPopulerEvent extends MovieEvents {}
class GetTopRateEvent extends MovieEvents {}
import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
final String success ;
final String statusCode;
final String statusMessage;

ErrorModel({required this.success,required this.statusCode, required this.statusMessage});


factory ErrorModel.fromjason( Map<String,dynamic> jason ){
  return ErrorModel(success: jason["success"], statusCode: jason["status_code"], statusMessage:jason["status_message"]);
}

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode,statusMessage,success];


}
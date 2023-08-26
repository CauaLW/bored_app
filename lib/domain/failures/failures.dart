import 'package:equatable/equatable.dart';

abstract class Failure {
  late final String message;
}

class ServerFailure extends Failure with EquatableMixin {
  @override
  String get message => 'An error occurred while getting the data, please try again :(';

  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure with EquatableMixin {
  @override
  String get message => 'An unexpected error occurred, please try again :(';

  @override
  List<Object?> get props => [];
}

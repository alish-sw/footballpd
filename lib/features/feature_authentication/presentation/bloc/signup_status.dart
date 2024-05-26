import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';


abstract class SignUpStatus extends Equatable {}


class SignUpLoading extends SignUpStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignUpCompleted extends SignUpStatus{
  final UserModel userModel;
  SignUpCompleted(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];

}

class SignUpStatusError extends SignUpStatus{
  final String? message;
  SignUpStatusError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => throw [message];
}
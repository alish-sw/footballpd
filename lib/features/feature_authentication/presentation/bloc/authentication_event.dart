part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent
{
  final UserEntity userEntity;
  SignUpEvent(this.userEntity);
}
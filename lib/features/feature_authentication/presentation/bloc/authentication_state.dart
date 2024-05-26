part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
 final SignUpStatus signUpStatus;
 const AuthenticationState({required this.signUpStatus});


 AuthenticationState copyWith({
  SignUpStatus ? newSignUpStatus
}){
  return AuthenticationState(
      signUpStatus:newSignUpStatus??signUpStatus);
 }

  @override
  // TODO: implement props
  List<Object?> get props => [signUpStatus];

}



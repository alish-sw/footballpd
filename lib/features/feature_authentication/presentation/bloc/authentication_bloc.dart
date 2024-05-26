import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';
import 'package:test/features/feature_authentication/presentation/bloc/signup_status.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_cases/get_user_signup_data_usecase.dart';
import '../../domain/use_cases/set_user_signout_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  GetUserSignUpDataUseCase _getUserSignUpDataUseCase;

  
  AuthenticationBloc(this._getUserSignUpDataUseCase) : super(AuthenticationState(signUpStatus: SignUpLoading()))  {
    on<SignUpEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(newSignUpStatus:SignUpLoading()));
      DataState _dataState=await _getUserSignUpDataUseCase(event.userEntity);

      if(_dataState is DataSuccess)
        {
          emit(state.copyWith(newSignUpStatus:SignUpCompleted(_dataState.data)));
        }

      if(_dataState is DataFailed)
        {
          emit(state.copyWith(newSignUpStatus:SignUpStatusError(_dataState.error)));
        }
    });
  }
}

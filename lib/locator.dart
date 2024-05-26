import 'package:get_it/get_it.dart';

import 'features/feature_authentication/data/data_source/auth_service_provider.dart';
import 'features/feature_authentication/data/repository/authentication_repositoryimp.dart';
import 'features/feature_authentication/domain/repository/authentication_repository.dart';
import 'features/feature_authentication/domain/use_cases/get_user_signup_data_usecase.dart';
import 'features/feature_authentication/domain/use_cases/set_user_signout_usecase.dart';
import 'features/feature_authentication/presentation/bloc/authentication_bloc.dart';

GetIt locator=GetIt.instance;
Future<void>setup() async {
  locator.registerSingleton<AuthServiceProvider>(AuthServiceProvider());

  locator.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImp(locator()));
  
  
  locator.registerSingleton<GetUserSignUpDataUseCase>(GetUserSignUpDataUseCase(locator()));
  locator.registerSingleton<SetUserSignOutUseCase>(SetUserSignOutUseCase(locator()));


  locator.registerSingleton<AuthenticationBloc>(AuthenticationBloc(locator()));

}
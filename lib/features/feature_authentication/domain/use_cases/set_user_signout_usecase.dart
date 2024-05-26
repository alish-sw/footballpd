

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/authentication_repository.dart';

class SetUserSignOutUseCase implements UseCase<DataState,NoParams>
{
  final AuthenticationRepository _authenticationRepository;
  SetUserSignOutUseCase(this._authenticationRepository);
  @override
  Future<DataState> call(NoParams params) {
    // TODO: implement call
    return _authenticationRepository.logOutUser();
  }

}


import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_model.dart';
import '../entity/user_entity.dart';
import '../repository/authentication_repository.dart';

class GetUserSignUpDataUseCase implements UseCase<DataState<UserModel>,UserEntity>
{
  final AuthenticationRepository _authenticationRepository;
  GetUserSignUpDataUseCase(this._authenticationRepository);
  @override
  Future<DataState<UserModel>> call(UserEntity params) {
    // TODO: implement call
    return _authenticationRepository.fetchUserData(params);
  }
  
}
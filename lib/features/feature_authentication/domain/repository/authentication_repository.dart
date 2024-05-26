

import '../../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entity/user_entity.dart';
//repository methods that most implement
abstract class AuthenticationRepository{
  Future<DataState<UserModel>> fetchUserData(UserEntity user);
  Future<DataState>logOutUser();
}
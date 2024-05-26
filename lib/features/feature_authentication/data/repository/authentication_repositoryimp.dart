

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/authentication_repository.dart';
import '../data_source/auth_service_provider.dart';
import '../models/user_model.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository{
  AuthServiceProvider _authServiceProvider;
  AuthenticationRepositoryImp(this._authServiceProvider);
  @override
  Future<DataState<UserModel>> fetchUserData(UserEntity user) async {
    // TODO: implement fetchUserData
        try{
          var res=await _authServiceProvider.signUpUser(user.username, user.password);
          //if res returned always not null
          return DataSuccess(res);
        }
        catch(e){
           return const DataFailed("please check your Internet Connection");
        }
  }

  @override
  Future<DataState> logOutUser() async {
    // TODO: implement logOutUser
    try{
      var res=await _authServiceProvider.signOutUser();
      //if res returned always not null and user signout
      return const DataSuccess(null);
    }
    catch(e){
      return const DataFailed("please check your Internet Connection");
    }
  }

}
import 'package:makeup/src/feature/auth/data/api_repository/auth_api_repository.dart';
import 'package:makeup/src/feature/auth/domain/interface/i_auth_api_repository.dart';

class AuthUseCase {
  late IAuthApiRepository _repository;
  AuthUseCase({IAuthApiRepository? repository}) {
    _repository = repository ?? AuthApiRepository();
  }
}

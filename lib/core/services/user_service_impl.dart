import 'package:dio/dio.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';
import '../repositories/user_service_repository.dart';
import 'api.dart';

//Agrega implementación de repository para UserService
class UserServiceImpl implements UserServiceRepository {
  late API _api;

  //Agrega inyeción de dependencia de clase API
  UserServiceImpl({required API api}) {
    _api = api;
  }

  //Implementa metodo para obtener publicaciones del usuario
  @override
  Future<List<Post>> getPosts({required int id}) async {
    try {
      Response response = await _api.sendRequest.get('/users/$id/posts');
      List<dynamic> data = response.data;
      return data.map((e) => Post.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  //Implementa metodo para obtener listado de usuarios
  @override
  Future<List<User>> getUsers() async {
    try {
      Response response = await _api.sendRequest.get('/users');
      List<dynamic> data = response.data;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

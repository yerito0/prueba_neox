import '../models/post_model.dart';
import '../models/user_model.dart';

//Agrega repository para implementación para UserService apuntando a la API
abstract class UserServiceRepository {
  Future<List<User>> getUsers();
  Future<List<Post>> getPosts({required int id});
}

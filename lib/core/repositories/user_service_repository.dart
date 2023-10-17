import '../models/post_model.dart';
import '../models/user_model.dart';

abstract class UserServiceRepository {
  Future<List<User>> getUsers();
  Future<List<Post>> getPosts({required int id});
}

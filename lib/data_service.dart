// lib/data_service.dart
import 'package:dio/dio.dart';
import 'user.dart';

class DataService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-api-key': 'reqres_bbca121c38f748198e21e44314b34e2b',
      },
    ),
  );

  // Get raw data (Map) dari /users
  Future<Map<String, dynamic>?> getUsers() async {
    try {
      final response = await dio.get('/users');
      // debugPrint(response.data.toString());
      return Map<String, dynamic>.from(response.data);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('DioException getUsers: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        // ignore: avoid_print
        print('Error getUsers: $e');
      }
      return null;
    }
  }

  // Get data dan map ke model User
  Future<List<User>?> getUserModel() async {
    try {
      final response = await dio.get('/users');
      if (response.statusCode == 200) {
        final data = response.data;
        final List usersJson = data['data'] as List;
        final users = usersJson.map((e) => User.fromJson(Map<String, dynamic>.from(e))).toList();
        return users;
      }
      return null;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('DioException getUserModel: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        // ignore: avoid_print
        print('Error getUserModel: $e');
      }
      return null;
    }
  }

  // POST menggunakan model UserCreate
  Future<UserCreate?> postUser(UserCreate user) async {
    try {
      final response = await dio.post('/users', data: user.toMap());
      // ignore: avoid_print
      print('POST status: ${response.statusCode} data: ${response.data}');
      if (response.statusCode == 201) {
        final created = UserCreate.fromJson(Map<String, dynamic>.from(response.data));
        return created;
      }
      return null;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('DioException postUser: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        // ignore: avoid_print
        print('Error postUser: $e');
      }
      return null;
    }
  }

  // PUT update user
  Future<UserCreate?> putUser(String idUser, String name, String job) async {
    try {
      final response = await dio.put('/users/$idUser', data: {'name': name, 'job': job});
      // ignore: avoid_print
      print('PUT status: ${response.statusCode} data: ${response.data}');
      if (response.statusCode == 200) {
        final updated = UserCreate.fromJson(Map<String, dynamic>.from(response.data));
        // ensure id present
        updated.id ??= idUser;
        return updated;
      }
      return null;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('DioException putUser: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        // ignore: avoid_print
        print('Error putUser: $e');
      }
      return null;
    }
  }

  // DELETE user
  Future<String?> deleteUser(String idUser) async {
    try {
      final response = await dio.delete('/users/$idUser');
      // ignore: avoid_print
      print('DELETE status: ${response.statusCode} data: ${response.data}');
      if (response.statusCode == 204) {
        return 'Delete user success';
      }
      return null;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('DioException deleteUser: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        // ignore: avoid_print
        print('Error deleteUser: $e');
      }
      return null;
    }
  }
}

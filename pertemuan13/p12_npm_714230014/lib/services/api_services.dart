import 'package:dio/dio.dart';
import '../model/contact_model.dart';

class ApiServices {
  final Dio _dio;

  ApiServices()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://contactsapi-production.up.railway.app/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  Future<List<ContactsModel>> getAllContact() async {
    try {
      final response = await _dio.get('/contacts');

      if (response.statusCode == 200) {
        final Iterable it = response.data['data'];
        final List<ContactsModel> contacts =
            it.map((e) => ContactsModel.fromJson(e)).toList();
        return contacts;
      } else {
        throw Exception('Failed to load contacts: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error fetching contacts: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<ContactsModel> postContact(String nama, String nomor) async {
    try {
      final response = await _dio.post(
        '/contacts',
        data: {
          'nama_kontak': nama,
          'nomor_hp': nomor,
        },
      );

      if (response.statusCode == 201) {
        return ContactsModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to create contact: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error creating contact: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> deleteContact(String id) async {
    try {
      final response = await _dio.delete('/contacts/$id');

      if (response.statusCode != 200) {
        throw Exception('Failed to delete contact: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error deleting contact: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

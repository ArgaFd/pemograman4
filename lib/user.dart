// lib/user.dart
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'] is int ? data['id'] : int.parse(data['id'].toString()),
      email: data['email'] ?? '',
      firstName: data['first_name'] ?? '',
      lastName: data['last_name'] ?? '',
      avatar: data['avatar'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(id=$id, name=$firstName $lastName, email=$email)';
  }
}

class UserCreate {
  String? id;
  String name;
  String job;
  String? createdAt;

  UserCreate({
    this.id,
    required this.name,
    required this.job,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'job': job};
  }

  factory UserCreate.fromJson(Map<String, dynamic> data) {
    // initialize timezone once
    try {
      tz.initializeTimeZones();
    } catch (_) {}
    final jakarta = tz.getLocation('Asia/Jakarta');
    final nowInJakarta = tz.TZDateTime.now(jakarta);
    final result = DateFormat.yMd().add_jm().format(nowInJakarta);
    return UserCreate(
      id: data['id']?.toString(),
      name: data['name'] ?? '',
      job: data['job'] ?? '',
      createdAt: data['createdAt']?.toString() ?? data['updatedAt']?.toString() ?? result,
    );
  }

  @override
  String toString() {
    return 'UserCreate={id=$id, name=$name, job=$job, createdAt=$createdAt}';
  }
}

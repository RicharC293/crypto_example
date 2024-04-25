import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/models/user/user.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();

  factory DatabaseService() {
    return instance;
  }

  DatabaseService._internal();

  late Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  Future<User> createUser({
    required String email,
    required String password,
  }) async {
    try {
      /// use to simulate a delay
      await Future.delayed(const Duration(seconds: 2));
      final user = User()
        ..email = email
        ..password = password;
      await _isar.writeTxn(() async {
        await _isar.users.put(user);
      });

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<User> getUser({
    required String email,
    required String password,
  }) async {
    try {
      /// use to simulate a delay
      await Future.delayed(const Duration(seconds: 2));
      final user = await _isar.writeTxn(() async {
        return await _isar.users.filter().emailEqualTo(email).findFirst();
      });
      if (user == null) throw Exception('User not found');
      if (user.password != password) throw Exception('Invalid password');
      return user;
    } catch (err) {
      rethrow;
    }
  }
}

import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String? email;

  /// Password of the user, is not a good practice to store it in plain text
  String? password;
}
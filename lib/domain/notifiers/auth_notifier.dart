import 'package:crypto_example/services/database_service.dart';
import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._databaseService);

  final DatabaseService _databaseService;

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login({required String email, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _databaseService.getUser(email: email, password: password);
      _isAuthenticated = true;
    } catch (err) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _databaseService.createUser(email: email, password: password);
      _isAuthenticated = true;
      notifyListeners();
    } catch (err) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      _isLoading = true;
      notifyListeners();
      return await _databaseService.getPassword(email: email);
    } catch (err) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

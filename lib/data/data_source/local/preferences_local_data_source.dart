import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/constants/keys.dart';
import '../../../core/error/exceptions.dart';

abstract class PreferencesLocalDataSource {
  Future<void> persistToken(String token);

  Future<String?> get token;
}

class PreferencesLocalDataSourceImpl implements PreferencesLocalDataSource {
  const PreferencesLocalDataSourceImpl(this.secureStorage);

  final FlutterSecureStorage secureStorage;

  @override
  Future<void> persistToken(String token) async {
    try {
      await secureStorage.write(key: SharedPrefKeys.token, value: token);
    } catch (_) {
      throw SecureStorageException();
    }
  }

  @override
  Future<String?> get token async {
    try {
      return await secureStorage.read(key: SharedPrefKeys.token);
    } catch (_) {
      throw SecureStorageException();
    }
  }
}

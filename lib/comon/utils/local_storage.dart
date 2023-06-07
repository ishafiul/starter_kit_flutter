import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LocalStorage {
  String _getItem(String item) {
    final box = Hive.box('storage');
    return box.get(item, defaultValue: '') as String;
  }

  Future<void> _setItem(String key, dynamic value) async {
    final box = Hive.box('storage');
    await box.put(key, value);
  }

  String get token {
    return _getItem('token');
  }

  Future<void> setToken(String token) async {
    await _setItem('token', token);
  }
}

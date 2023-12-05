import 'package:hive/hive.dart';

class HiveHelper {
  static const hiveAppName = "RepositoryDioByHanifAbdullah";
  static const hiveIsLoggedIn = "isLoggedIn";
  static const hiveToken = "token";
  static const hiveRefreshToken = "refresh_token";

  static final _hive = Hive.box<dynamic>(hiveAppName);

  static getData(String key, {dynamic defaultvalue}) {
    return _hive.get(key, defaultValue: defaultvalue);
  }

  static putData(String key, dynamic data) {
    return _hive.put(key, data);
  }

  static deleteData(String keyName) {
    return _hive.delete(keyName);
  }

  static bool checkKey(dynamic key) {
    bool check = _hive.containsKey(key);
    return check;
  }
}

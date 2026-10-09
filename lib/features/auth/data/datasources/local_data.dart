import 'package:e_commerce/common/appConstants/constats.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalData {
  Future<void> setToken(String? tkoen);
  Future<String?> getToken();
}

@Injectable(as: LocalData)
class Datalocalimpl implements LocalData {
  final FlutterSecureStorage _flutterSecureStorage;

  Datalocalimpl({required this._flutterSecureStorage});
  @override
  Future<String?> getToken() async {
    try {
      String? token = await _flutterSecureStorage.read(
        key: AppConstants.secuerKey,
      );
      return token; 
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setToken(String? tkoen) async {
    try {
      await _flutterSecureStorage.write(
        key: AppConstants.secuerKey,
        value: tkoen,
      );
    } on Exception catch (e) {
      // TODO
    }
  }
}

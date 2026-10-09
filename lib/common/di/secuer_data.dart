import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SecuerData {
 @singleton
  FlutterSecureStorage get getscuerstroage {
    
    FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(),
    );
    return storage;
  }
}

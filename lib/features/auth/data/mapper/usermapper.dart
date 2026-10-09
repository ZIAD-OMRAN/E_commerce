import 'package:e_commerce/features/auth/data/models/usermodel/usermodel/usermodel.dart';
import 'package:e_commerce/features/auth/domain/entities/userentity.dart';

extension Usermapper on UserEntity  {
  Usermodel get getmodel => Usermodel(
    
    email: email,
    name: name,
    password: password,
    rePassword: password,

  );
}
